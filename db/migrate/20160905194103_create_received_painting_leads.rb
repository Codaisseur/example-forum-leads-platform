class CreateReceivedPaintingLeads < ActiveRecord::Migration[5.0]
  def change
    create_table :received_painting_leads do |t|
      t.references :artist, foreign_key: true
      t.references :painting_lead, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
