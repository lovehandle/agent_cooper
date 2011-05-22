require 'spec_helper'

module AgentCooper
  describe Request do
    subject { Request }

    before(:each) do
      @request = subject.new
    end
    
    describe "#parameters" do
      it "returns a hash" do
        @request.parameters.should be_a(Hash)
      end
    end

    describe "#<<" do
      it "merges a hash into the existing parameters" do
        @request << {:foo => "bar"}
        @request.parameters[:foo].should == "bar"
      end
    end

    describe "#locale" do
      it "defaults to :us" do
        @request.locale.should == :us
      end
    end

    describe "#reset!" do
      it "resets the parameters to a blank hash" do
        @request << {:foo => 'bar'}
        @request.reset!
        @request.parameters.should_not have_key(:foo)
      end
    end
  end
end
