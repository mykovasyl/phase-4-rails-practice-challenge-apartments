class ApartmentSerializer < ActiveModel::Serializer
  attributes :id, :number
  has_many :tenants, through: :leases

end
