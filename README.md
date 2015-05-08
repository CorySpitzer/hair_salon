Hair Salon:
A very basic hair salon management app

Cory Spitzer
Epicodus Code Review
May 8th, 2015

DB overview:

clients       | stylists
------------- | -------------
id            | id
name          | name
stylist_id    |

API notes:
  * Two clients are considered equal if they have the same name and
    the same is true for stylists, thus clients must be given unique
    names with the current API setup.

Setup instructions:
  * Create the DB with `pg_restore -d hair_salon hair_salon.dump`
  * Run `ruby app.rb` to launch the server
  * Enjoy running your salon!

MIT License
