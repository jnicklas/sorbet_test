require "test_helper"

class ButtonTest < ActiveSupport::TestCase
  test "renders the button label" do
    html = Components::Button.new(label: "Select user").call

    assert_includes html, "Select user"
    assert_includes html, "type=\"button\""
  end
end
