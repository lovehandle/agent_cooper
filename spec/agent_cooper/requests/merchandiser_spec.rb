require 'spec_helper'

module AgentCooper
  describe Merchandiser do

    subject { Merchandiser.new }

    it "inherits from AgentCooper::Request" do
      subject.should be_a(Request)
    end

  end
end
