require 'spec_helper'

describe AgentCooper::Response do

  subject { described_class.new(:response => response) }

  let(:body) { "<root><foo baz='blah'>Some Text</foo></root>" }
  let(:code) { 200 }

  let(:response) { mock(:response, :body => body, :code => code) }

  its(:body)    { should eql(body) }
  its(:code)    { should eql(code) }
  its(:to_hash) { should be_a(Hash)}
  its(:valid?)  { should be_true }

  context "when code != 200" do
    let(:code) { 400 }
    its(:valid?) { should be_false }
  end

end
