#!/usr/bin/env ruby
# typed: strict

require "phlex"
require "sorbet-runtime"

module Ui
  class UserSelectComponent < SelectComponent
    extend T::Sig

    sig do
      params(
        results_path: String,
        label: String,
        placeholder: String,
        empty_state_text: String,
      ).void
    end
    def initialize(results_path:, label: "Choose a user", placeholder: "Search users", empty_state_text: "Search to load users")
      super(label: label, results_path: results_path)
      @placeholder = T.let(placeholder, String)
      @empty_state_text = T.let(empty_state_text, String)
    end

    sig { override.void }
    def panel
      form(action: results_path, method: "get", class: "select-picker__search-form", data: { select_target: "form" }) do
        input(
          type: "search",
          name: "q",
          value: "",
          placeholder: @placeholder,
          autocomplete: "off",
          class: "select-picker__search",
          data: { select_target: "search", action: "input->select#search" },
        )
      end

      div(class: "select-picker__results", data: { select_target: "results" }) do
        div(class: "select-picker__empty") do
          plain @empty_state_text
        end
      end
    end
  end
end