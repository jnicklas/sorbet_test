require "application_system_test_case"
require "securerandom"

class SelectPickerTest < ApplicationSystemTestCase
  setup do
    User.delete_all
  end

  test "loads matching users from the remote endpoint" do
    suffix = SecureRandom.hex(4)
    User.create!(name: "Alice Example", email: "alice-#{suffix}@example.com")
    User.create!(name: "Bob Example", email: "bob-#{suffix}@example.com")

    visit root_path

    click_button "Choose a user"
    fill_in "Search users", with: "alice"

    assert_text "Alice Example"
    assert_no_text "Bob Example"
  end
end
