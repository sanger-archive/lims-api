require 'spec_helper'

###################################################################################################
# SHARED CONTEXT FOR CONTEXT
###################################################################################################
shared_context 'needs a context' do
  let(:context) { mock(:context) }

  before(:each) do
    context_service = Object.new
    context_service.should_receive(:new).with(instance_of(Sinatra::Request)).and_return(context)
    app.set(:context_service, context_service)
  end
end

###################################################################################################
# SHARED CONTEXTS FOR REQUEST BODIES
###################################################################################################
shared_context 'has a request body to be decoded' do

end

shared_context 'does not provide a request body' do
  let(:params)  { [] }
end

shared_context 'can decode the request body' do
  let(:params) { [ 'params' ] }

  let(:decoder) do
    mock(:decoder).tap do |decoder|
      decoder.should_receive(:call).with(io_stream('request-body')).and_return('params')
    end
  end
end

###################################################################################################
# SHARED CONTEXTS FOR WHETHER AN ACTION PERFORMS THE WORK
###################################################################################################
shared_context 'performed through an action' do |action_method|
  let(:result) { mock(:result) }

  let(:action) do
    mock(action_method).tap do |action|
      action.should_receive(:call).with(no_args).and_return(result)
      target.should_receive(action_method).with(context, *params).and_return(action)
    end
  end
end

shared_context 'is not performed through an action' do
  let(:action) { nil }
  let(:result) { target }
end

###################################################################################################
# SHARED CONTEXTS FOR RESPONSES
###################################################################################################
shared_context 'success response' do |status|
  before(:each) { encoder.should_receive(:status).and_return(status) }

  after(:each) do
    last_response.status.should == status
    last_response.content_type.should == 'encoder-content-type'
    last_response.body.should == 'response-body'
  end
end

shared_context 'error response' do |status, body|
  after(:each) do
    last_response.status.should == status
    last_response.content_type.should == 'application/json'
    last_response.body.should == %Q{{"general":[#{body.inspect}]}}
  end
end

###################################################################################################
# SHARED CONTEXTS THAT CAN BE POINTS OF FAILURE
###################################################################################################
shared_context 'gets to decoding the request body' do
  before(:each) do
    target.should_receive(:decoder_for).with('request-body-content-type').and_return(decoder)
  end
end

shared_context 'gets to encoding the response' do
  before(:each) do
    result.should_receive(:encoder_for).with(['request-content-type'], anything).and_return(encoder)
  end

  before(:each) { result ; target ; action }
end

###################################################################################################
# SHARED CONTEXTS FOR EACH ACTION
###################################################################################################
shared_context 'POST' do |uri|
  include_context 'has a request body to be decoded'
  include_context('performed through an action', :creator)

  it "POST #{uri}" do
    header('Accept', 'request-content-type')
    header('Content-Type', 'request-body-content-type')
    post(uri, "request-body")
  end
end

shared_context 'PUT' do |uri|
  include_context 'has a request body to be decoded'
  include_context('performed through an action', :updater)

  it "PUT #{uri}" do
    header('Accept', 'request-content-type')
    header('Content-Type', 'request-body-content-type')
    put(uri, "request-body")
  end
end

shared_context 'DELETE' do |uri|
  include_context 'does not provide a request body'
  include_context('performed through an action', :deleter)

  it "DELETE #{uri}" do
    header('Accept', 'request-content-type')
    delete(uri)
  end
end

shared_context 'GET' do |uri|
  include_context 'does not provide a request body'
  include_context 'is not performed through an action'

  it "GET #{uri}" do
    header('Accept', 'request-content-type')
    get(uri)
  end
end

shared_examples_for 'when the body cannot be decoded' do |uri|
  let(:decoder) { nil }

  include_context 'gets to decoding the request body'
  include_context('error response', 415, 'content type cannot be decoded')

  include_context('POST', uri)
  include_context('PUT', uri)
end

shared_examples_for 'completes successfully' do |uri|
  let(:encoder) do
    mock(:encoder, :content_type => 'encoder-content-type').tap do |encoder|
      encoder.should_receive(:call).and_return('response-body')
    end
  end

  include_context 'gets to encoding the response'

  context do
    include_context('success response', 200)
    include_context('GET', uri)
  end

  context do
    include_context 'gets to decoding the request body'
    include_context('can decode the request body')
    include_context('success response', 201)
    include_context('POST', uri)
  end

  context do
    include_context 'gets to decoding the request body'
    include_context('can decode the request body')
    include_context('success response', 200)
    include_context('PUT', uri)
  end

  context do
    include_context('success response', 200)
    include_context('DELETE', uri)
  end
end

shared_examples_for 'cannot encode the response' do |uri|
  let(:encoder) { nil }

  include_context 'gets to encoding the response'
  include_context('error response', 406, 'unacceptable content type requested')

  context do
    include_context('GET', uri)
  end

  context do
    include_context 'gets to decoding the request body'
    include_context('can decode the request body')
    include_context('POST', uri)
  end

  context do
    include_context 'gets to decoding the request body'
    include_context('can decode the request body')
    include_context('PUT', uri)
  end

  context do
    include_context('DELETE', uri)
  end
end

shared_examples_for 'missing resource' do |uri|
  let(:resource) { nil }

  include_context('error response', 404, 'resource could not be found')

  include_context('GET', uri)
  include_context('POST', uri)
  include_context('PUT', uri)
  include_context('DELETE', uri)
end

shared_examples_for 'something' do |lookup, root, uri|
  include_context 'needs a context'

  before(:each) { context.should_receive(lookup).with(root).and_return(resource) }

  it_behaves_like('missing resource', uri)

  context 'resource exists' do
    let(:resource) { mock(:resource) }

    it_behaves_like('when the body cannot be decoded', uri)
    it_behaves_like('cannot encode the response', uri)
    it_behaves_like('completes successfully', uri)
  end
end

shared_examples_for 'resource' do |lookup, root|
  it_behaves_like('something', lookup, root, "/#{root}") do
    let(:target) { resource }
  end

  it_behaves_like('something', lookup, root, "/#{root}/action") do
    let(:target) do
      mock(:action).tap do |action|
        resource.should_receive(:action).with('action').and_return(action)
      end
    end
  end
end

describe Lims::Api::Server do
  it_behaves_like('resource', :for_uuid, '11111111-2222-3333-4444-555555555555')
  it_behaves_like('resource', :for_model, 'model')
end
