shared_examples_for "Request" do

  before(:each) do
    AgentCooper::Config.app_id = app_id
  end

  let(:app_id)   { "12345ABCDE" }
  let(:host)     { described_class::HOST }
  let(:path)     { described_class::PATH }

  let(:encoding) { described_class::ENCODING }
  let(:version)  { described_class::VERSION }

  its(:host)    { should eql(host) }
  its(:path)    { should eql(path) }

  its(:parameters) { should eql({}) }
  its(:request_adapter)  { should be_a(HTTPClient) }

  describe "#reset!" do
    it "sets the request parameters to a blank hash" do
      subject.reset!
      subject.parameters.should == {}
    end
  end

  describe "<<" do
    let(:parameters) do
      { "SECURITY-APPNAME" => app_id }
    end

    it { (subject << parameters).should eql(parameters) }

    context "parameters is not a Hash" do
      let(:parameters) { "" }

      specify do
        expect { subject << parameters }.to raise_error
      end
    end
  end

  describe "#get" do
    let(:request_adapter) { double(HTTPClient) }
    let(:url) { "http://dummy.com/1234" }

    let(:response) { double(:response) }

    before do
      subject.stub(:request_adapter).and_return(request_adapter)
      subject.stub(:url).and_return(url)

      request_adapter.stub(:get).with(url).and_return(response)
    end

    it "gets a request" do
      request_adapter.should_receive(:get).with(url)
      subject.get
    end

    it "initializes a new Response" do
      AgentCooper::Response.should_receive(:new).with(:response => response)
      subject.get
    end
  end

end
