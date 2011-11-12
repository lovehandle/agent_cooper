require 'spec_helper'

describe AgentCooper::Finder do
  it_behaves_like "Request" do
    let(:expected_default_parameters) do
      {
        "SECURITY-APPNAME"     => app_id,
        "SECURITY-VERSION"     => version,
        "RESPONSE-DATA-FORMAT" => encoding,
        "REST-PAYLOAD"         => ""
      }
    end

    its(:default_parameters) { should eql(expected_default_parameters) }
  end
end