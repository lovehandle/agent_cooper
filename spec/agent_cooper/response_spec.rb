require 'spec_helper'

module AgentCooper
  describe Response do

    let(:response) { '<root><item></item></root>' }

    subject { Response.new(response) }

    before(:each) do
      response.stub(:body).and_return(response)
    end

    describe "#body" do
      it "delegates to response#code" do
        response.should_receive(:body)
        subject.body
      end
    end

    describe "#to_hash" do
      it "converts the xml to a hash" do
        subject.to_hash.should == { "item"=> {} }
      end
    end

    describe "#code" do
      it "delegate to response#code" do
        response.should_receive(:code)
        subject.code
      end
    end

    describe "#valid?" do
      context "#code returns '200'" do
        before(:each) do
          subject.stub(:code).and_return(200)
        end

        it "returns true" do
          subject.valid?.should be_true
        end
      end

      context "#code does not return '200'" do
        before(:each) do
          subject.stub(:code).and_return(500)
        end

        it "returns false" do
          subject.valid?.should be_false
        end
      end
    end

  end
end
