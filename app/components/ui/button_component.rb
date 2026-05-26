#!/usr/bin/env ruby
# typed: strict

require "phlex"
require "sorbet-runtime"

module Ui
  class ButtonComponent < Phlex::HTML
    extend T::Sig

    sig { params(label: String).void }
    def initialize(label:)
      @label = T.let(label, String)
    end

    sig { void }
    def view_template
      button(type: "button", class: "ui-button") do
        plain @label
      end
    end

    private

    sig { returns(String) }
    attr_reader :label
  end
end