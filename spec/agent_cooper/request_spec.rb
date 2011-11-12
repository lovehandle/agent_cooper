require 'spec_helper'

describe AgentCooper::Request do
  describe "#parameters" do
    let(:query_parameters) do
      { "SECURITY-APPNAME" => "123456",
        "SECURITY-VERSION" => 781 }
    end

    let(:default_parameters) do
      { "REST-PAYLOAD"     => "",
        "SECURITY-VERSION" => 582 }
    end

    let(:expected_parameters) do
      { "SECURITY-APPNAME" => "123456",
        "SECURITY-VERSION" => 781,
        "REST-PAYLOAD"     => "" }
    end

    before do
      subject.stub(:default_parameters).and_return(default_parameters)
      subject.stub(:query_parameters).and_return(query_parameters)
    end

    its(:parameters) { should eql(expected_parameters) }
  end
end