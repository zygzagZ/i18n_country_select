require "spec_helper"

describe I18nCountrySelect::FormHelpers do
	describe "country_code_select" do
		include I18nCountrySelect::FormHelpers

		before(:each) do
			@user = mock("User", :country => nil)
		end
		
		it "should output a select field with countries" do
			output = country_code_select(:user, :country)
      output.should match(/select id="user_country"/)
		end

		it "should output a select field with priority countries" do
			output = country_code_select(:user, :country, [ "US", 'United States' ])
			output.should match(/option value="US"/)
		end

		it "should output a select field with passed attributes" do
			output = country_code_select(:user, :country, [ "US", "United States" ], class: "custom_class")
			output.should match(/select class="custom_class"/)
		end
		
		it "should output a valid select field for fields_for nested attributes" do
		  # no idea how to write the test for this.
      # output.should match /select id="user_shipping_address_attributes_country"/
		end
	end
end
