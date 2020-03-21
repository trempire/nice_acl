RSpec.describe NiceAcl do
  it "has a version number" do
    expect(NiceAcl::VERSION).not_to be nil
  end

  it "returns Hello world" do
    expect(subject.hello_world).to eq("Hello World")
  end
end
