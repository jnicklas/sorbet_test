# typed: strict

require "sorbet-runtime"

class UsersController < ApplicationController
  extend T::Sig

  sig { void }
  def index
    users = User.search(search_term).limit(20).to_a

    render partial: "users/user", collection: users, as: :user, layout: false
  end

  private

  sig { returns(T.nilable(String)) }
  def search_term
    T.cast(params[:q], T.nilable(String))&.strip
  end
end
