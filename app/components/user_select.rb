#!/usr/bin/env ruby
# typed: strict

require "phlex"
require "sorbet-runtime"

module Components
  class UserSelect < Base
    extend T::Sig

    sig { params(label: String).void }
    def initialize(label: "Choose a user")
      @label = T.let(label, String)
    end

    sig { void }
    def view_template
      render Select.new(
        label: @label,
        results_path: users_path,
        placeholder: "Search users",
        empty_state_text: "Search to load users",
      )
    end
  end
end
