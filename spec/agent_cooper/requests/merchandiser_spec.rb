require 'spec_helper'

describe AgentCooper::Merchandiser do
  it_behaves_like "Request" do
    let(:service_name) { described_class::SERVICE_NAME }

    let(:expected_default_parameters) do
      {
        "CONSUMER-ID"          => app_id,
        "SERVICE-NAME"         => service_name,
        "SERVICE-VERSION"      => version,
        "RESPONSE-DATA-FORMAT" => encoding,
        "REST-PAYLOAD"         => ""
      }
    end

    its(:default_parameters) { should eql(expected_default_parameters) }
  end
end