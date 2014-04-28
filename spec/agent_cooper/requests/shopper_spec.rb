require 'spec_helper'

describe AgentCooper::Shopper do
  it_behaves_like "Request" do

    let(:site_id) { described_class::SITE_ID }

    let(:defaults) do
      {
        "APPID"            => app_id,
        "RESPONSEENCODING" => encoding,
        "VERSION"          => version,
        "SITEID"           => site_id
      }
    end

    its(:defaults) { should eql(defaults) }

  end
end
