class Location < ApplicationRecord
  has_and_belongs_to_many :artists
  has_many :painting_leads
  has_many :received_painting_leads
end
