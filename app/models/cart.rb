class Cart < ApplicationRecord
    belongs_to :user, optional: true
    has_many :suits
end
