# typed: strict

require "sorbet-runtime"

class HomeController < ApplicationController
  extend T::Sig

  sig { void }
  def index
    render Views::Home::Index.new(user: User.first)
  end
end
