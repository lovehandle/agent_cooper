require 'spec_helper'

describe AgentCooper do

  subject { described_class }

  describe ".configure" do
    it "yields a Config object" do
      subject.configure do |c|
        c.should == AgentCooper::Config
      end
    end
  end

end
