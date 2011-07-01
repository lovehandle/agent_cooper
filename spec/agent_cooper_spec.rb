require 'spec_helper'

describe AgentCooper do

  subject { AgentCooper }

  describe ".configure" do
    it "yields a Config object" do
      subject.configure {|c| c.should == AgentCooper::Config }
    end
  end
end
