require 'spec_helper'

module AgentCooper
  describe Config do
    subject { Config }

    describe ".app_id=" do
      it "sets a value for @@app_id" do
        subject.app_id = "12345"
        subject.class_variables.should include("@@app_id")
      end
    end

    describe ".app_id" do
      it "returns @@app_id value" do
        subject.app_id = "6789"
        subject.app_id.should == "6789"
      end
    end
  end
end
