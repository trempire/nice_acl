require "spec_helper"

require "generators/nice_acl/nice_acl_generator"

RSpec.describe NiceACL::Generators::NiceACLGenerator, type: :generator do
  destination File.expand_path("../.././../tmp", __FILE__)

  before { prepare_destination }

  it "runs hello wolrd command" do
    gen = generator
    allow(gen).to receive(:hello_world)

    gen.invoke_all

    expect(gen).to have_received :hello_world
  end

  it "returns Hello world" do
    expect(generator.invoke_all).to eq(["Hello world"])
  end
end
