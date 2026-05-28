# typed: strict

module Components
  module Selectable
    extend T::Sig
    extend T::Helpers

    interface!

    sig { abstract.returns(String) }
    def label; end

    sig { abstract.returns(String) }
    def value; end
  end
end
