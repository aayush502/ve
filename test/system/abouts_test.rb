require "application_system_test_case"

class AboutsTest < ApplicationSystemTestCase
  setup do
    @about = abouts(:one)
  end

  test "visiting the index" do
    visit abouts_url
    assert_selector "h1", text: "Abouts"
  end

  test "creating a About" do
    visit abouts_url
    click_on "New About"

    fill_in "Privacy", with: @about.privacy
    fill_in "Terms and condition", with: @about.terms_and_condition
    fill_in "Thank you", with: @about.thank_you
    fill_in "Welcome", with: @about.welcome
    click_on "Create About"

    assert_text "About was successfully created"
    click_on "Back"
  end

  test "updating a About" do
    visit abouts_url
    click_on "Edit", match: :first

    fill_in "Privacy", with: @about.privacy
    fill_in "Terms and condition", with: @about.terms_and_condition
    fill_in "Thank you", with: @about.thank_you
    fill_in "Welcome", with: @about.welcome
    click_on "Update About"

    assert_text "About was successfully updated"
    click_on "Back"
  end

  test "destroying a About" do
    visit abouts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "About was successfully destroyed"
  end
end
