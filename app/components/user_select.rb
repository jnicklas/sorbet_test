#!/usr/bin/env ruby
# typed: strict

require "phlex"
require "sorbet-runtime"

module Components
  class UserSelect < Base
    extend T::Sig

    sig { params(label: String, selected: T.nilable(User)).void }
    def initialize(label: "Choose a user", selected: nil)
      @label = T.let(label, String)
      @selected = T.let(selected, T.nilable(User))
    end

    sig { void }
    def view_template
      render Select.new(
        label: @label,
        results_path: users_path,
        placeholder: "Search users",
        empty_state_text: "Search to load users",
        selected: @selected,
      )
    end
  end
end
