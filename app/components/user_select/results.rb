#!/usr/bin/env ruby
# typed: strict

require "sorbet-runtime"

module Components
  class UserSelect < Base
    class Results < Base
      extend T::Sig

      sig { params(users: T::Array[User]).void }
      def initialize(users:)
        @users = T.let(users, T::Array[User])
      end

      sig { void }
      def view_template
        if @users.empty?
          div(class: "select-picker__empty") { plain "No users found" }
        else
          @users.each { |user| render Item.new(user: user) }
        end
      end
    end
  end
end
