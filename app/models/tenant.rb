class Tenant < ApplicationRecord
  has_many :leases
  has_many :apartments, through: :leases

  validates :name, presence: true
  validates :age, exclusion: { in: 0..17, message: "Must be 18 years or older" }
end
