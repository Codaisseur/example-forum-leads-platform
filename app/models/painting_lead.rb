class PaintingLead < ApplicationRecord
  belongs_to :location
  belongs_to :service_type
end
