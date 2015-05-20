require 'spec_helper'

describe "audios/index" do
  before(:each) do
    assign(:audios, [
      stub_model(Audio),
      stub_model(Audio)
    ])
  end

  it "renders a list of audios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
