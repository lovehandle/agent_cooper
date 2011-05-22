require 'spec_helper'

module AgentCooper
  describe Finder do
    subject { Finder }
    let(:request) { subject.new }

    before(:all) do
      Request::APP_ID = 'app_id'
    end

    describe "#get" do
      it "returns a response object" do
        request.get.should be_a(Response)
      end
    end
  end

end
