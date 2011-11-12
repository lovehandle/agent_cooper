require "spec_helper"

describe AgentCooper::Config do

  subject { described_class }

  let(:app_id) { "123456ABCD" }

  describe  ".app_id" do
    before do
      subject.instance_variable_set(:@app_id, app_id)
    end

    its(:app_id) { should eql(app_id) }
  end

  describe ".app_id=" do
    it "sets app_id" do
      subject.app_id = app_id
      subject.instance_variable_get(:@app_id).should eql(app_id)
    end
  end

  describe ".configure" do
    it "yields an AgentCooper::Config" do
      subject.configure do |obj|
        obj.should eql(described_class)
      end
    end

    context "when no block is given" do
      it { should raise_error }
    end
  end

end