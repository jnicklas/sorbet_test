# typed: strict

require "sorbet-runtime"

class HomeController < ApplicationController
  extend T::Sig

  sig { void }
  def index; end
end
