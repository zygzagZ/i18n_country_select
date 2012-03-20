require "spec_helper"

describe I18nCountrySelect::FormHelpers do
	it "should include country_code_select method" do
		ActionView::Helpers::FormBuilder.instance_methods.should include(:country_code_select)
	end
end
