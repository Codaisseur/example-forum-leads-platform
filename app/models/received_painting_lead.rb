class ReceivedPaintingLead < ApplicationRecord
  belongs_to :artist
  belongs_to :painting_lead
  belongs_to :location
end
