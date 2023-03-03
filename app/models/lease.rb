class Lease < ApplicationRecord
    belongs_to :tenant
    belongs_to :apartment 

    validates :rent, numericality: {greater_than_or_equal_to: 1}
    validates :apartment_id, presence: true
    validates :tenant_id, presence: true
end
