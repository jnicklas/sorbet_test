#!/usr/bin/env ruby
# typed: strict

require "phlex"
require "sorbet-runtime"

module Ui
  class SelectComponent < Phlex::HTML
    extend T::Sig

    sig do
      params(
        label: String,
        results_path: String,
        placeholder: String,
        empty_state_text: String,
      ).void
    end
    def initialize(label:, results_path:, placeholder: "Search", empty_state_text: "No results")
      @label = T.let(label, String)
      @results_path = T.let(results_path, String)
      @placeholder = T.let(placeholder, String)
      @empty_state_text = T.let(empty_state_text, String)
    end

    sig { void }
    def view_template
      render Ui::DropdownComponent.new(label: @label) do
        div(data: { controller: "select", select_results_path_value: @results_path }) do
          form(action: @results_path, method: "get", class: "select-picker__search-form", data: { select_target: "form" }) do
            input(
              type: "search",
              name: "q",
              value: "",
              placeholder: @placeholder,
              autocomplete: "off",
              autofocus: true,
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
  end
end
