require 'spec_helper'

describe "doctors/edit" do
  before(:each) do
    @doctor = assign(:doctor, stub_model(Doctor,
      :name => "MyString"
    ))
  end

  it "renders the edit doctor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", doctor_path(@doctor), "post" do
      assert_select "input#doctor_name[name=?]", "doctor[name]"
    end
  end
end
