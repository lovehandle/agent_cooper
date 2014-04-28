require 'spec_helper'

describe AgentCooper::Finder do
  it_behaves_like "Request" do

    let(:defaults) do
      {
        "SECURITY-APPNAME"     => app_id,
        "SECURITY-VERSION"     => version,
        "RESPONSE-DATA-FORMAT" => encoding,
        "REST-PAYLOAD"         => ""
      }
    end

    its(:defaults) { should eql(defaults) }

  end
end
