require 'spec_helper'

describe "artists/index" do
  before(:each) do
    assign(:artists, [
      stub_model(Artist),
      stub_model(Artist)
    ])
  end

  it "renders a list of artists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
