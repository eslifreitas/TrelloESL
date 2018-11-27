require "application_system_test_case"

class PersonsTest < ApplicationSystemTestCase
  setup do
    @person = persons(:one)
  end

  test "visiting the index" do
    visit persons_url
    assert_selector "h1", text: "Persons"
  end

  test "creating a Person" do
    visit persons_url
    click_on "New Person"

    fill_in "Email", with: @person.email
    fill_in "Name", with: @person.name
    fill_in "Role", with: @person.role
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "updating a Person" do
    visit persons_url
    click_on "Edit", match: :first

    fill_in "Email", with: @person.email
    fill_in "Name", with: @person.name
    fill_in "Role", with: @person.role
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "destroying a Person" do
    visit persons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Person was successfully destroyed"
  end
end
