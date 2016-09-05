class ServiceType < ApplicationRecord
  has_and_belongs_to_many :artists
  has_many :painting_leads
end
