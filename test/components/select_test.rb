require "test_helper"

class SelectTest < ActiveSupport::TestCase
  test "renders a generic shell without user-specific content" do
    html = Components::Select.new(
      label: "Choose an option",
      results_path: "/options",
    ).call

    assert_includes html, "Choose an option"
    assert_includes html, "data-controller=\"select\""
    assert_includes html, "data-select-results-path-value=\"/options\""
    assert_no_match(/Search to load users/, html)
  end
end
