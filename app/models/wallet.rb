class Wallet < ApplicationRecord
  belongs_to :user
  has_many :cards
end
