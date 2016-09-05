class CreateArtistsServiceTypes < ActiveRecord::Migration[5.0]
  def change
    create_join_table :artists, :service_types
  end
end
