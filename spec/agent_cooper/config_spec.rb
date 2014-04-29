require "spec_helper"

describe AgentCooper::Config do

  subject { described_class }

  let(:app_id) { "123456ABCD" }
  let(:env_app_id) { "654321ABCD" }

  describe  ".app_id" do
    before do
      subject.stub(:env_app_id).and_return(env_app_id)
    end

    context "when set" do
      before do
        subject.instance_variable_set(:@app_id, app_id)
      end

      its(:app_id) { should eql(app_id) }
    end

    context "when not set" do
      before do
        subject.instance_variable_set(:@app_id, nil)
      end

      its(:app_id) { should eql(env_app_id) }
    end
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
      it "raises an error" do
        expect { described_class.configure }.to raise_error
      end
    end
  end

end
