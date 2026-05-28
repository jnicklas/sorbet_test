#!/usr/bin/env ruby
# typed: strict

require "phlex"
require "sorbet-runtime"

module Components
  class Select < Base
    class Item < Base
      extend T::Sig

      sig { params(selectable: Selectable).void }
      def initialize(selectable:)
        @selectable = T.let(selectable, Selectable)
      end

      sig { params(blk: T.proc.void).void }
      def view_template(&blk)
        button(
          type: "button",
          class: "select-picker__item",
          data: {
            action: "click->select#select",
            select_label_param: @selectable.label,
            select_value_param: @selectable.value,
          }
        ) { yield }
      end
    end
  end
end
