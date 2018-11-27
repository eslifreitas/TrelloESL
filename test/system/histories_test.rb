require "application_system_test_case"

class HistoriesTest < ApplicationSystemTestCase
  setup do
    @history = histories(:one)
  end

  test "visiting the index" do
    visit histories_url
    assert_selector "h1", text: "Histories"
  end

  test "creating a History" do
    visit histories_url
    click_on "New History"

    fill_in "Deadline", with: @history.deadline
    fill_in "Description", with: @history.description
    fill_in "Finished At", with: @history.finished_at
    fill_in "Name", with: @history.name
    fill_in "Owner", with: @history.owner_id
    fill_in "Points", with: @history.points
    fill_in "Project", with: @history.project_id
    fill_in "Requester", with: @history.requester_id
    fill_in "Started At", with: @history.started_at
    fill_in "Status", with: @history.status
    click_on "Create History"

    assert_text "History was successfully created"
    click_on "Back"
  end

  test "updating a History" do
    visit histories_url
    click_on "Edit", match: :first

    fill_in "Deadline", with: @history.deadline
    fill_in "Description", with: @history.description
    fill_in "Finished At", with: @history.finished_at
    fill_in "Name", with: @history.name
    fill_in "Owner", with: @history.owner_id
    fill_in "Points", with: @history.points
    fill_in "Project", with: @history.project_id
    fill_in "Requester", with: @history.requester_id
    fill_in "Started At", with: @history.started_at
    fill_in "Status", with: @history.status
    click_on "Update History"

    assert_text "History was successfully updated"
    click_on "Back"
  end

  test "destroying a History" do
    visit histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "History was successfully destroyed"
  end
end
