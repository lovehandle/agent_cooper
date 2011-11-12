require 'spec_helper'

describe AgentCooper::Shopper do
  it_behaves_like "Request" do
    let(:site_id) { described_class::SITE_ID }

    let(:expected_default_parameters) do
      {
        "APPID"            => app_id,
        "RESPONSEENCODING" => encoding,
        "VERSION"          => version,
        "SITEID"           => site_id
      }
    end

    its(:default_parameters) { should eql(expected_default_parameters) }
  end
end