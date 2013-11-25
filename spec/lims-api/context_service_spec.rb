require 'spec_helper'
require 'lims-api/context_service'

module Lims::Api

  module ContextSaver
    def new(*args, &block)
      super(*args, &block).tap do |context|
        @last_context = context
      end
    end 
    def last_context
      @last_context
    end
  end

  shared_context "server environment" do
    let(:message_bus) { mock(:bus).tap do |bus|
        bus.stub(:connect)
      end
    }
    let(:store) { mock(:store).tap do |store| 
        store.stub(:with_session).and_yield(mock(:session))
      end }
    let(:context) { context_service.last_context }
    let(:context_service) { ContextService.new(store, message_bus).tap do |context_service|
        context_service.extend ContextSaver
      end }
    before(:each) do
      app.set(:context_service, context_service)
    end
  end

  shared_examples_for "creating a valid context for" do |action|
  end

  shared_examples_for "responding to action" do |action|
    context "valid header" do
      let(:user) { 'user@from.header' }
      let(:application_id) { 'context service spec' }
      it "create a valid context on #{action}" do
        header('content-type', 'anything')
        header('user-email', user) if user
        header('application-id', application_id) if application_id

        self.send(action, 'url')
        context.user.should == user
        context.application_id.should == application_id
      end
    end

    context "invalid header" do
      before(:each) { header('content-type', 'anything') }
      context "strict mode" do
        it "generates an error on #{action}" do
          context_service.strict = true
          response = self.send(action, 'url')
          response.status.should == 400
          self.send(action, 'url')
        end
      end
      context "leniant mode" do
        it "use default value on #{action}", action => true, :leniant => true do
          context_service.strict = false
          response = self.send(action, 'url')

          context.user.should_not be_nil
          context.application_id.should_not be_nil
        end

      end
    end
  end

  describe ContextService do
    context "in a server environment" do
      include_context "server environment"
      %w(get post put delete patch).each do |action|
        it_behaves_like "responding to action", action
      end
    end
  end
end
