require('client')
require('stylist')
require('rspec')
require('pg')
require('pry')

# This purposefully breaks convention to distinguish this DB
# from the prodution DB, which we conventionally call 'DB'
DBTest = PG.connect(:dbname => "hair_salon_test")

RSpec.configure do |config|
  config.after(:each) do
    DBTest.exec('DELETE FROM clients *;')
    DBTest.exec('DELETE FROM stylists *;')
    DBTest.exec('DELETE FROM clients_stylists *;')
  end
end
