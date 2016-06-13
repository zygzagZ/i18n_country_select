# coding: utf-8
require "spec_helper"

describe "Form Helpers" do
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

    it "should output a select field with priority countries and include_blank line at the beginning" do
      output = country_code_select(:user, :country, [ "US", 'United States' ], :include_blank => true)
      output.should include('<select id="user_country" name="user[country]"><option></option>')
    end

    it "should output a select field with priority countries and include_blank line with comment" do
      output = country_code_select(:user, :country, [ "US", 'United States' ], :include_blank => "Choose..")
      output.should include('<select id="user_country" name="user[country]"><option>Choose..</option>')
    end

    it "should output a select field with passed attributes" do
      output = country_code_select(:user, :country, [ "US", "United States" ], {}, :class => "custom_class")
      output.should match(/select class="custom_class"/)
    end

    it "should output a valid select field for fields_for nested attributes" do
      # no idea how to write the test for this.
      # output.should match /select id="user_shipping_address_attributes_country"/
    end

    it "should not contain missing translations" do
      output = country_code_select(:user, :country, [ "US", "United States" ], {}, :class => "custom_class")
      output.should_not match(/translation missing/)
    end

    describe 'selection' do
      before(:each) do
        @user = mock('User', :country => 'US')
      end

      it 'should output a select field with a selected country' do
        output = country_code_select(:user, :country)
        output.should include('<option value="US" selected="selected">')
      end

      it 'should output a select field with a selected country' do
        output = country_code_select(:user, :country, [], { :selected => 'CA' })
        output.should include('<option value="CA" selected="selected">')
      end
    end

    describe "sorting order" do
    # TODO:
    # Get the i18n-country-translations loaded. We need to get the app loaded first so the translations will load
    # We may need to do something with fake_app

      context "en" do
        it "should sort countries in right order" do
          country_code_select(:user, :country).should match /American Samoa.+Jamaica.+Ukraine/m
        end
      end

      context "ru" do
        before { I18n.locale = :ru }
        after  { I18n.locale = :en }

        it "should sort countries in right order" do
          country_code_select(:user, :country).should match /Американское Самоа.+Украина.+Ямайка/m
        end
      end

      context "fr" do
        before { I18n.locale = :fr }
        after  { I18n.locale = :en }

        it "should sort countries in right order" do
          country_code_select(:user, :country).should match /Sénégal.+Swaziland.+Syrie/m
        end
      end
    end
  end
end
