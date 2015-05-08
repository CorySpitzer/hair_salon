require('client')
require('stylist')
require('rspec')
require('pg')
require('pry')

# WARNING: This will stomp on and be stomped on by the DB constant in app.rb
# which will be a connection to the 'hair_salon' database.
DB = PG.connect(:dbname => "hair_salon_test")

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM clients *;')
    DB.exec('DELETE FROM stylists *;')
  end
end
