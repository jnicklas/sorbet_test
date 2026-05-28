#!/usr/bin/env ruby
# typed: strict

require "phlex"
require "sorbet-runtime"

module Components
  class Select < Base
    extend T::Sig

    sig do
      params(
        label: String,
        results_path: String,
        placeholder: String,
        empty_state_text: String,
        selected: T.nilable(Selectable),
      ).void
    end
    def initialize(label:, results_path:, placeholder: "Search", empty_state_text: "No results", selected: nil)
      @label = T.let(label, String)
      @results_path = T.let(results_path, String)
      @placeholder = T.let(placeholder, String)
      @empty_state_text = T.let(empty_state_text, String)
      @selected = T.let(selected, T.nilable(Selectable))
    end

    sig { void }
    def view_template
      button_label = @selected ? @selected.label : @label

      div(data: { controller: "select", select_results_path_value: @results_path, select_selected_value: @selected&.value }) do
        render Dropdown.new(
          label: button_label,
          trigger_data: { select_target: "trigger" },
          panel_data: {
            select_target: "panel",
            action: "toggle->select#handleToggle"
          }
        ) do
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
