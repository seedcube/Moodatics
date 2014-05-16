require 'spec_helper'

describe "doctors/new" do
  before(:each) do
    assign(:doctor, stub_model(Doctor,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new doctor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", doctors_path, "post" do
      assert_select "input#doctor_name[name=?]", "doctor[name]"
    end
  end
end
