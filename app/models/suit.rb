class Suit < ApplicationRecord
    belongs_to :profile, optional: true
    belongs_to :cart, optional: true
end
