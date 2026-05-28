#!/usr/bin/env ruby
# typed: strict

require "sorbet-runtime"

module Components
  class UserSelect < Base
    class Item < Base
      extend T::Sig

      sig { params(user: User).void }
      def initialize(user:)
        @user = T.let(user, User)
      end

      sig { void }
      def view_template
        render Components::Select::Item.new(selectable: @user) do
          span(class: "user-option__name") { plain @user.name }
          span(class: "user-option__email") { plain @user.email }
        end
      end
    end
  end
end
