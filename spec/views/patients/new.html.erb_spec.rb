require 'spec_helper'

describe "patients/new" do
  before(:each) do
    assign(:patient, stub_model(Patient,
      :first_name => "MyString",
      :last_name => "MyString",
      :middle_name => "MyString",
      :email => "MyString",
      :doctor_id => 1,
      :role_id => 1
    ).as_new_record)
  end

  it "renders new patient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", patients_path, "post" do
      assert_select "input#patient_first_name[name=?]", "patient[first_name]"
      assert_select "input#patient_last_name[name=?]", "patient[last_name]"
      assert_select "input#patient_middle_name[name=?]", "patient[middle_name]"
      assert_select "input#patient_email[name=?]", "patient[email]"
      assert_select "input#patient_doctor_id[name=?]", "patient[doctor_id]"
      assert_select "input#patient_role_id[name=?]", "patient[role_id]"
    end
  end
end
