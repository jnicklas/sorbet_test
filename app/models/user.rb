# typed: strict

require "sorbet-runtime"

class User < ApplicationRecord
  extend T::Sig
  include Components::Selectable

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  sig { override.returns(String) }
  def label = name

  sig { override.returns(String) }
  def value = id.to_s

  sig { params(term: T.nilable(String)).returns(ActiveRecord::Relation) }
  def self.search(term)
    normalized_term = T.let(term&.strip, T.nilable(String))

    return all.order(:name) if normalized_term.blank?

    pattern = "%#{normalized_term.downcase}%"
    where("lower(name) LIKE :pattern OR lower(email) LIKE :pattern", pattern: pattern).order(:name)
  end
end
