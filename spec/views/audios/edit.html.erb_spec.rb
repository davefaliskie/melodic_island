require 'spec_helper'

describe "audios/edit" do
  before(:each) do
    @audio = assign(:audio, stub_model(Audio))
  end

  it "renders the edit audio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", audio_path(@audio), "post" do
    end
  end
end
