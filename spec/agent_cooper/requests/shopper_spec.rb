require 'spec_helper'

module AgentCooper
  describe Shopper do

    subject { Shopper.new }

    it "inherits from AgentCooper::Request" do
      subject.should be_a(Request)
    end

  end
end
