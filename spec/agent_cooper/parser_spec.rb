require 'spec_helper'

describe AgentCooper::Parser do

  subject { described_class.new(response) }

  let(:body) { "<root><foo baz='blah'>Some Text</foo></root>" }
  let(:status) { 200 }

  let(:response) { double(:response, :body => body, :status => status) }

  its(:body)    { should eql(body) }
  its(:status)    { should eql(status) }
  its(:to_hash) { should be_a(Hash)}
  its(:valid?)  { should be_true }

  context "when status != 200" do
    let(:status) { 400 }
    its(:valid?) { should be_false }
  end

end
