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
  its(:request_adapter)  { should eq(Excon) }

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
    before do
      Excon.stub({}, {})
    end

    after do
      Excon.stubs.clear
    end

    it "gets a Response" do
      expect(subject.get(mock: true)).to be_an AgentCooper::Response
    end
  end

end
