require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "search matches name and email" do
    matching_user = User.create!(name: "Alice Example", email: "alice@example.com")
    User.create!(name: "Bob Example", email: "bob@example.com")

    results = User.search("alice")

    assert_equal [ matching_user ], results
  end

  test "search falls back to ordered users when blank" do
    second_user = User.create!(name: "Zed Example", email: "zed@example.com")
    first_user = User.create!(name: "Amy Example", email: "amy@example.com")

    results = User.search(nil)

    assert_equal [ first_user, second_user ], results
  end
end
