# typed: strict

module Views
  module Home
    class Index < Views::Base
      extend T::Sig

      sig { params(user: T.nilable(User)).void }
      def initialize(user:)
        @user = T.let(user, T.nilable(User))
      end

      sig { void }
      def view_template
        div(class: "home-page") do
          h1(class: "home-page__title") { "Select Picker Prototype" }
          p(class: "home-page__lead") { "Phlex renders the shell, Stimulus opens and searches, and the users endpoint streams the options." }
          render UserSelect.new(selected: @user)
        end
      end
    end
  end
end
