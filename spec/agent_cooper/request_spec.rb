require 'spec_helper'

module AgentCooper

  describe Request do

    let(:adapter) { mock(HTTPClient) }
    let(:url)     { 'http://foo.com' }

    let(:response) { 'bar' }

    let(:host)  { 'foo.com' }
    let(:path)  { '/bar' }
    let(:query) { 'foo=bar&bar=foo' }

    let(:default_parameters) { {:foo => 'bar'} }
    let(:parameters)    { {:bar => 'foo'} }

    let(:config) { mock(Config) }

    subject { Request }

    before(:each) do
      @request = subject.new
    end

    describe "#app_id" do
      before(:each) do
        @request.instance_variable_set(:@config, config)
      end

      it "calls @config.app_id" do
        config.should_receive(:app_id)
        @request.app_id
      end
    end

    describe "#adapter" do
      it "defaults to HTTPClient" do
        @request.adapter.should be_a(HTTPClient)
      end
    end

    describe "#get" do
      before(:each) do
        adapter.stub(:get).and_return(response)

        @request.stub(:adapter).and_return(adapter)
        @request.stub(:url).and_return(url)
      end

      it "calls adapter#get" do
        adapter.should_receive(:get).with(url)
        @request.get
      end

      it "initializes a new AgentCooper::Response" do
        Response.should_receive(:new).with(response)
        @request.get
      end

      it "returns an AgentCooper::Response" do
        @request.get.should be_a(Response)
      end
    end

    describe "#url" do
      before(:each) do
        @request.stub(:host).and_return(host)
        @request.stub(:path).and_return(path)
        @request.stub(:query).and_return(query)
      end

      it "builds the correct url" do
        URI::HTTP.should_receive(:build).with(:host => host, :path => path, :query => query)
        @request.url
      end

      it "returns an instance of URI::HTTP" do
        @request.url.should be_a(URI::HTTP)
      end
    end

    describe "#query" do
      before(:each) do
        @request.stub(:default_parameters).and_return(default_parameters)
        @request.stub(:parameters).and_return(parameters)
      end

      it "returns the query" do
        @request.query.should == "bar=foo&foo=bar"
      end
    end

    describe "#parameters" do
      it "returns a hash" do
        @request.parameters.should be_a(Hash)
      end
    end

    describe "#<<" do
      it "merges a hash into the existing parameters" do
        @request << {:foo => "bar"}
        @request.parameters[:foo].should == "bar"
      end
    end

    describe "#reset!" do
      it "resets the parameters to a blank hash" do
        @request << {:foo => 'bar'}
        @request.reset!
        @request.parameters.should_not have_key(:foo)
      end
    end
  end

end
