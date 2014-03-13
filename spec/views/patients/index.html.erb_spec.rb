require 'spec_helper'

describe "patients/index" do
  before(:each) do
    assign(:patients, [
      stub_model(Patient,
        :first_name => "First Name",
        :last_name => "Last Name",
        :middle_name => "Middle Name",
        :email => "Email",
        :doctor_id => 1,
        :role_id => 2
      ),
      stub_model(Patient,
        :first_name => "First Name",
        :last_name => "Last Name",
        :middle_name => "Middle Name",
        :email => "Email",
        :doctor_id => 1,
        :role_id => 2
      )
    ])
  end

  it "renders a list of patients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
