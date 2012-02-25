require 'spec_helper'

describe Lims::Api::Server do
  it 'does nothing at the moment' do
    get('/')

    last_response.status.should == 404
  end
end
