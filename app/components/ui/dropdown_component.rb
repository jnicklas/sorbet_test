#!/usr/bin/env ruby
# typed: strict

require "phlex"
require "sorbet-runtime"

module Ui
  class DropdownComponent < Phlex::HTML
    extend T::Sig

    sig { params(label: String).void }
    def initialize(label:)
      @label = T.let(label, String)
      @id = T.let("dropdown-#{SecureRandom.hex(4)}", String)
    end

    sig { params(blk: T.proc.void).void }
    def view_template(&blk)
      render Ui::ButtonComponent.new(
        label: @label,
        attributes: {
          popovertarget: @id,
          style: "anchor-name: --#{@id}",
        },
      )

      div(
        id: @id,
        popover: "",
        class: "dropdown__panel",
        style: "position-anchor: --#{@id}",
      ) do
        yield
      end
    end
  end
end
