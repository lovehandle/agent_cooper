require 'spec_helper'

module AgentCooper
  describe Request do
    subject { Request }

    before(:each) do
      @request = subject.new
    end
    
    describe "#options" do
      it "returns a hash" do
        @request.options.should be_a(Hash)
      end
    end

    describe "#<<" do
      it "merges a hash into the existing options" do
        @request << {:foo => "bar"}
        @request.options[:foo].should == "bar"
      end
    end

    describe "#reset!" do
      it "resets the parameters to a blank hash" do
        @request << {:foo => 'bar'}
        @request.reset!
        @request.options.should_not have_key(:foo)
      end
    end
  end
end
