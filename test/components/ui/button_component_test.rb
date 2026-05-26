require "test_helper"

class Ui::ButtonComponentTest < ActiveSupport::TestCase
  test "renders the button label" do
    html = Ui::ButtonComponent.new(label: "Select user").call

    assert_includes html, "Select user"
    assert_includes html, "type=\"button\""
  end
end