require 'spec_helper'

module AgentCooper
  describe Finder do

    subject { Finder.new }

    it "inherits from AgentCooper::Request" do
      subject.should be_a(Request)
    end

  end
end
