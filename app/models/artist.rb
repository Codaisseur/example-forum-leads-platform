class Artist < ApplicationRecord
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :service_types
  has_many :received_painting_leads

  # after_create :approve
  #
  # def approve
  #   ArtistMailer.approved_email(self).deliver
  #   update_column :approved, true
  # end
end
