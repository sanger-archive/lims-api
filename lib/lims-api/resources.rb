require 'facets/kernel'
unless defined?(Lims::Core::NO_AUTOLOAD)
require_all('resources/*.rb')
end
