require('sinatra')
require('sinatra/reloader')
also_reload('./lib/*.rb')
require('./lib/client')
require('./lib/stylist')
require('pg')
require('pry')

# WARNING: This will stomp on and be stomped on by the DB constant in
# spec_helper.rb, which will be a connection to the 'hair_salon_test' database.
DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end
