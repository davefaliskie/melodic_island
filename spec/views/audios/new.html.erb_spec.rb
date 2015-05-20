require 'spec_helper'

describe "audios/new" do
  before(:each) do
    assign(:audio, stub_model(Audio).as_new_record)
  end

  it "renders new audio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", audios_path, "post" do
    end
  end
end
