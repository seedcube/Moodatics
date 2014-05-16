require 'spec_helper'

describe "doctors/index" do
  before(:each) do
    assign(:doctors, [
      stub_model(Doctor,
        :name => "Name"
      ),
      stub_model(Doctor,
        :name => "Name"
      )
    ])
  end

  it "renders a list of doctors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
