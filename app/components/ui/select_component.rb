#!/usr/bin/env ruby
# typed: strict

require "phlex"
require "sorbet-runtime"

module Ui
  class SelectComponent < DropdownComponent
    extend T::Sig

    sig { params(label: String, results_path: String).void }
    def initialize(label:, results_path:)
      super(label: label)
      @results_path = T.let(results_path, String)
    end

    sig { override.void }
    def panel
      div(data: { controller: "select", select_results_path_value: @results_path }) do
        select_panel
      end
    end

    sig { void }
    def select_panel; end

    private

    sig { returns(String) }
    attr_reader :results_path
  end
end
