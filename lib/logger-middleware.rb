# This class is logging the HTTP request/response start and finish with the given logger.
# It is a middleware, which come between the calling client and the server,
# process the HTTP request before sending it to the server, and processing
# the HTTP response before returning it to the client.
class LoggerMiddleware

  def initialize(app, logger)
    @logger = logger
    @app = app
  end

  def call(env)
    began_at = Time.now
    log_data = "#{env["REQUEST_METHOD"]} #{env["PATH_INFO"]}"

    # log the beginning of the request
    log("API [start] #{log_data}")

    begin
      status, header, body = @app.call(env)

      # log our custom generated HTTP errors
      logerror(body) unless [200, 201].include?(status)
      env['sinatra.error'].andtap { |e| log_exception(e) }

    rescue StandardError, LoadError, SyntaxError => e
      # log the caught exception
      log_exception(e)
    end
    log("API [finished] #{log_data}", began_at)
    [status, header, body]
  end

  # log the given string with INFO level
  def log(log_str, began_at=nil)
    unless began_at.nil?
      spent_time = Time.now - began_at
      log_str += " in #{spent_time.to_s}"
    end

    @logger.info { log_str }
  end

  # log the error messages/exceptions with ERROR level
  def logerror(errors)
    errors.each { |message|
      @logger.error { message }
    }
  end

  # assamle the caught exception and its back trace to a string
  def dump_exception(exception)
    string = "#{exception.class}: #{exception.message}\n"
    string << exception.backtrace.map { |l| "\t#{l}" }.join("\n")
    string
  end

  def log_exception(exception)
    logerror([dump_exception(exception)])
  end

end
