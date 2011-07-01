require 'spec_helper'

module AgentCooper
  describe Config do

    let(:app_id) { "12345" }

    subject { Config }

    describe ".app_id=" do
      it "sets a value for @app_id" do
        subject.app_id = app_id
        subject.instance_variable_get("@app_id").should == app_id
      end
    end

    describe ".app_id" do
      it "returns @app_id value" do
        subject.instance_variable_set("@app_id", app_id)
        subject.app_id.should == app_id
      end
    end
  end
end
