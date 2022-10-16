class Apartment < ApplicationRecord
  has_many :tenants
  has_many :leases, dependent: :destroy

  validates :number, presence: true
end
