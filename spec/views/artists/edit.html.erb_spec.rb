require 'spec_helper'

describe "artists/edit" do
  before(:each) do
    @artist = assign(:artist, stub_model(Artist))
  end

  it "renders the edit artist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", artist_path(@artist), "post" do
    end
  end
end
