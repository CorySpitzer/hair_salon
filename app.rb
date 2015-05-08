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

get('/stylists') do
  @stylists = Stylist.all
  erb(:stylists)
end

post('/stylists') do
  name = params.fetch("stylist_name")
  stylist = Stylist.new(name: name)
  stylist.save
  @stylists = Stylist.all
  erb(:stylists)
end

get('/clients') do
  @clients = Client.all
  erb(:clients)
end

post('/clients') do
  @clients = Client.all
  erb(:clients)
end
