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
      ).void
    end
    def initialize(label:, results_path:)
      @label = T.let(label, String)
      @results_path = T.let(results_path, String)
    end

    sig { void }
    def view_template
      div(class: "select-picker", data: { controller: "select", select_results_path_value: @results_path }) do
        div(class: "select-picker__toggle") do
          render Ui::ButtonComponent.new(
            label: @label,
            attributes: {
              data: { action: "click->select#toggle" },
              aria: { expanded: "false" },
            },
          )
        end

        div(class: "select-picker__panel", hidden: true, data: { select_target: "panel" }) do
          panel
        end
      end
    end

    sig { void }
    def panel; end

    private

    sig { returns(String) }
    attr_reader :results_path
  end
end