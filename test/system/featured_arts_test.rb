require "application_system_test_case"

class FeaturedArtsTest < ApplicationSystemTestCase
  setup do
    @featured_art = featured_arts(:one)
  end

  test "visiting the index" do
    visit featured_arts_url
    assert_selector "h1", text: "Featured Arts"
  end

  test "creating a Featured art" do
    visit featured_arts_url
    click_on "New Featured Art"

    click_on "Create Featured art"

    assert_text "Featured art was successfully created"
    click_on "Back"
  end

  test "updating a Featured art" do
    visit featured_arts_url
    click_on "Edit", match: :first

    click_on "Update Featured art"

    assert_text "Featured art was successfully updated"
    click_on "Back"
  end

  test "destroying a Featured art" do
    visit featured_arts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Featured art was successfully destroyed"
  end
end
