# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# create_table "artists", force: :cascade do |t|
#   t.string   "name"
#   t.boolean  "approved",   default: false
#   t.datetime "created_at",                 null: false
#   t.datetime "updated_at",                 null: false
# end

jon = Artist.create(name: "Jon", approved: true)
dory = Artist.create(name: "Dory", approved: true)
mike = Artist.create(name: "Mike", approved: true)
jane = Artist.create(name: "Jane", approved: true)

#
# create_table "artists_locations", id: false, force: :cascade do |t|
#   t.integer "artist_id",   null: false
#   t.integer "location_id", null: false
# end

#
# create_table "artists_service_types", id: false, force: :cascade do |t|
#   t.integer "artist_id",       null: false
#   t.integer "service_type_id", null: false
# end
#
# create_table "locations", force: :cascade do |t|
#   t.string   "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

amsterdam = Location.create(name: "Amsterdam")
utrecht = Location.create(name: "Utrecht")
the_hague = Location.create(name: "Den Haag")

#
# create_table "painting_leads", force: :cascade do |t|
#   t.string   "client_name"
#   t.string   "phone_number"
#   t.integer  "location_id"
#   t.integer  "service_type_id"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
#   t.index ["location_id"], name: "index_painting_leads_on_location_id", using: :btree
#   t.index ["service_type_id"], name: "index_painting_leads_on_service_type_id", using: :btree
# end

portrait = ServiceType.create(name: "Portrait Painting")
landscape = ServiceType.create(name: "Landscape Painting")

lead1 = PaintingLead.create(
  client_name: "Jim",
  phone_number: "03034809384",
  location: the_hague,
  service_type: portrait
)
lead2 = PaintingLead.create(
  client_name: "Estelle",
  phone_number: "03034809384",
  location: utrecht,
  service_type: landscape
)

jon.locations << amsterdam
jon.locations << utrecht
jon.service_types << portrait

dory.locations << the_hague
dory.service_types << portrait
dory.service_types << landscape

mike.locations << amsterdam
mike.service_types << portrait

jane.locations << utrecht
jane.service_types << landscape

#
# create_table "received_painting_leads", force: :cascade do |t|
#   t.integer  "artist_id"
#   t.integer  "painting_lead_id"
#   t.integer  "location_id"
#   t.datetime "created_at",       null: false
#   t.datetime "updated_at",       null: false
#   t.index ["artist_id"], name: "index_received_painting_leads_on_artist_id", using: :btree
#   t.index ["location_id"], name: "index_received_painting_leads_on_location_id", using: :btree
#   t.index ["painting_lead_id"], name: "index_received_painting_leads_on_painting_lead_id", using: :btree
# end
#
# create_table "service_types", force: :cascade do |t|
#   t.string   "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
