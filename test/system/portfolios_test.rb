require "application_system_test_case"

class PortfoliosTest < ApplicationSystemTestCase
  setup do
    @portfolio = portfolios(:one)
  end

  test "visiting the index" do
    visit portfolios_url
    assert_selector "h1", text: "Portfolios"
  end

  test "creating a Portfolio" do
    visit portfolios_url
    click_on "New Portfolio"

    fill_in "Category", with: @portfolio.category_id
    fill_in "Description", with: @portfolio.description
    fill_in "Image", with: @portfolio.image
    fill_in "Name", with: @portfolio.name
    click_on "Create Portfolio"

    assert_text "Portfolio was successfully created"
    click_on "Back"
  end

  test "updating a Portfolio" do
    visit portfolios_url
    click_on "Edit", match: :first

    fill_in "Category", with: @portfolio.category_id
    fill_in "Description", with: @portfolio.description
    fill_in "Image", with: @portfolio.image
    fill_in "Name", with: @portfolio.name
    click_on "Update Portfolio"

    assert_text "Portfolio was successfully updated"
    click_on "Back"
  end

  test "destroying a Portfolio" do
    visit portfolios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Portfolio was successfully destroyed"
  end
end
