#!/usr/bin/env ruby
# typed: strict

require "phlex"
require "sorbet-runtime"

module Components
  class Dropdown < Base
    extend T::Sig

    sig { params(label: String, panel_data: T.untyped, trigger_data: T.untyped).void }
    def initialize(label:, panel_data: {}, trigger_data: {})
      @label = T.let(label, String)
      @id = T.let("dropdown-#{SecureRandom.hex(4)}", String)
      @panel_data = T.let(panel_data, T.untyped)
      @trigger_data = T.let(trigger_data, T.untyped)
    end

    sig { params(blk: T.proc.void).void }
    def view_template(&blk)
      render Button.new(
        label: @label,
        attributes: {
          popovertarget: @id,
          style: "anchor-name: --#{@id}",
          data: @trigger_data,
        },
      )

      div(
        id: @id,
        popover: "",
        class: "dropdown__panel",
        style: "position-anchor: --#{@id}",
        data: @panel_data,
      ) do
        yield
      end
    end
  end
end
