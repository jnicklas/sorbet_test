#!/usr/bin/env ruby
# typed: strict

require "phlex"
require "sorbet-runtime"

module Ui
  class ButtonComponent < Phlex::HTML
    extend T::Sig

    sig { params(label: String, attributes: T.untyped).void }
    def initialize(label:, attributes: {})
      @label = T.let(label, String)
      @attributes = T.let(attributes, T.untyped)
    end

    sig { void }
    def view_template
      button(**@attributes, type: "button", class: "ui-button") do
        plain @label
      end
    end
  end
end
