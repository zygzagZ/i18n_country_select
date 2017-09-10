require "spec_helper"

describe "Form Builder" do
  it "should include country_code_select method" do
    expect ActionView::Helpers::FormBuilder.instance_methods.include?(:country_code_select)
  end
end
