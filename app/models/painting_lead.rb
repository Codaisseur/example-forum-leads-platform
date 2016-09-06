class PaintingLead < ApplicationRecord
  MAX_LEADS = 5

  belongs_to :location
  belongs_to :service_type
  has_many :received_painting_leads

  after_create :distribute_lead_to_artists

  def distribute_lead_to_artists
    current_leads_count = received_painting_leads.count
    return if current_leads_count >= MAX_LEADS

    candidates = Artist.select("artists.*,
      (SELECT MAX(received_painting_leads.created_at)
        FROM received_painting_leads
        WHERE artists.id = received_painting_leads.artist_id
        AND received_painting_leads.location_id = #{location_id})
        AS last_location_lead_received_at,
      (SELECT MAX(received_painting_leads.created_at)
        FROM received_painting_leads
        WHERE artists.id = received_painting_leads.artist_id)
        AS last_all_time_lead_received_at").
      joins("INNER JOIN artists_locations
        ON artists_locations.artist_id = artists.id
        WHERE artists_locations.location_id = #{location_id}").
      group("artists.id").
      order("last_location_lead_received_at DESC,
        last_all_time_lead_received_at DESC,
        RANDOM()").
      limit(MAX_LEADS - current_leads_count)

    candidates.map do |candidate|
      ReceivedPaintingLead.create(
        artist: candidate,
        location: location,
        painting_lead: self
      )
    end
  end
end
