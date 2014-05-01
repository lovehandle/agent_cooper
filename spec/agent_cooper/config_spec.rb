require "spec_helper"

describe AgentCooper::Config do

  subject { described_class }

  let(:app_id) { "123456ABCD" }

  describe  ".app_id" do
    context 'when set in environment' do
      before do
        @original_app_id = ENV['EBAY_APP_ID']
        ENV['EBAY_APP_ID'] = '123456DCBA'
      end

      after do
        ENV['EBAY_APP_ID'] = @original_app_id
      end

      its(:app_id) { should eql(ENV['EBAY_APP_ID']) }
    end

    context "when set" do
      before do
        subject.instance_variable_set(:@app_id, app_id)
      end

      after do
        subject.instance_variable_set(:@app_id, nil)
      end

      its(:app_id) { should eql(app_id) }
    end

    context "when not set" do
      it 'raises an error' do
        expect { subject.app_id }.to raise_error
      end
    end
  end

  describe ".app_id=" do
    it "sets app_id" do
      subject.app_id = app_id
      subject.instance_variable_get(:@app_id).should eql(app_id)
    end
  end

end
