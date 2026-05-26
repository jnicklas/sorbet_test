#!/usr/bin/env ruby
# typed: strict

require "phlex"
require "sorbet-runtime"

module Ui
  class UserSelectComponent < Phlex::HTML
    extend T::Sig

    sig { params(results_path: String, label: String).void }
    def initialize(results_path:, label: "Choose a user")
      @results_path = T.let(results_path, String)
      @label = T.let(label, String)
    end

    sig { void }
    def view_template
      render Ui::SelectComponent.new(
        label: @label,
        results_path: @results_path,
        placeholder: "Search users",
        empty_state_text: "Search to load users",
      )
    end
  end
end
