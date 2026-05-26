require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "returns matching users as an html fragment" do
    matching_user = User.create!(name: "Alice Example", email: "alice@example.com")
    User.create!(name: "Bob Example", email: "bob@example.com")

    get users_path, params: { q: "alice" }

    assert_response :success
    assert_includes response.body, matching_user.name
    assert_includes response.body, matching_user.email
    assert_not_includes response.body, "Bob Example"
  end
end
