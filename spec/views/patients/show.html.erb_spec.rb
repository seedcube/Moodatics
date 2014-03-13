require 'spec_helper'

describe "patients/show" do
  before(:each) do
    @patient = assign(:patient, stub_model(Patient,
      :first_name => "First Name",
      :last_name => "Last Name",
      :middle_name => "Middle Name",
      :email => "Email",
      :doctor_id => 1,
      :role_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Middle Name/)
    rendered.should match(/Email/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
