require 'spec_helper'

describe AgentCooper::Request do

  class Foo
    include AgentCooper::Request
    DEFAULTS = lambda { {"KEY" => "VALUE"} }
  end

  let(:defaults) do
    lambda { { "PARAM" => "FOO" } }
  end

  let(:klass) do
    Foo
  end

  context "instance methods" do
    subject { klass.new }
    describe "#defaults" do
      its(:defaults) { should == klass::DEFAULTS.call }
    end
  end

end
