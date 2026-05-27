# typed: strict

require "sorbet-runtime"

class UsersController < ApplicationController
  extend T::Sig

  layout false

  sig { void }
  def index
    users = T.let(User.search(search_term).limit(20).to_a, T::Array[User])
    render Components::UserSelect::Results.new(users:)
  end

  private

  sig { returns(T.nilable(String)) }
  def search_term
    T.cast(params[:q], T.nilable(String))&.strip
  end
end
