shared_examples_for "Request" do

  before do
    AgentCooper::Config.stub(:app_id).and_return(app_id)
  end

  let(:app_id)   { "12345ABCDE" }
  let(:host)     { described_class::HOST }
  let(:path)     { described_class::PATH }

  let(:encoding) { described_class::ENCODING }
  let(:version)  { described_class::VERSION }

  its(:app_id)  { should eql(app_id) }
  its(:host)    { should eql(host) }
  its(:path)    { should eql(path) }

  its(:query_parameters) { should eql({}) }

  describe "#reset!" do
    it "sets the request parameters to a blank hash" do
      subject.should_receive(:query_parameters=).with({})
      subject.reset!
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
    let(:body) { double(:body) }

    before do
      Excon.defaults[:mock] = true
      Excon.stub({}, body: body)
    end

    after do
      Excon.defaults[:mock] = false
      Excon.stubs.clear
    end

    it "wraps response in a parser" do
      expect(subject.get.body).to eq body
    end
  end
end
