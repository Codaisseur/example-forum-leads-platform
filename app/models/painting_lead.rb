class PaintingLead < ApplicationRecord
  belongs_to :location
  belongs_to :service_type
  has_many :received_painting_leads
end
