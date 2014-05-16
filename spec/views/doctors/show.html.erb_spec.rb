require 'spec_helper'

describe "doctors/show" do
  before(:each) do
    @doctor = assign(:doctor, stub_model(Doctor,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
