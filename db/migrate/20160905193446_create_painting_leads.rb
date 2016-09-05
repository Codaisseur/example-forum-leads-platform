class CreatePaintingLeads < ActiveRecord::Migration[5.0]
  def change
    create_table :painting_leads do |t|
      t.string :client_name
      t.string :phone_number
      t.references :location, foreign_key: true
      t.references :service_type, foreign_key: true

      t.timestamps
    end
  end
end
