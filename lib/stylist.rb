class Stylist
  attr_accessor :name
  attr_reader :id

  #TODO: .find

  def initialize(attributes)
    @name = attributes.fetch(:name)
    if attributes.has_key?(:id)
      @id = attributes.fetch(:id)
    else
      @id = nil
    end
  end

  def self.all
    stylists = []
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    returned_stylists.each do |stylist| #stylist is a pg object
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i
      stylists.push(Stylist.new(name: name, id: id))
    end
    stylists
  end

  def save
    # Write self into the DB and
    # return the id from the DB
    pg_result = DB.exec("INSERT INTO stylists (name)
                         VALUES ('#{@name}') RETURNING id;")
    @id = pg_result[0].fetch('id').to_i
  end

  def ==(other)
    self.name == other.name
  end

  def delete
    DB.exec("DELETE FROM stylists WHERE id = #{self.id};")
  end

  def add_client(client)
    # if self.id is nil, then we get a SQL error
    DB.exec("UPDATE clients SET stylist_id = #{self.id}
             WHERE id = #{client.id};")
  end

  def get_clients
    clients = []
    pg_results = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id};")
    pg_results.each do |row| # row is hash
      name = row.fetch("name")
      id = row.fetch("id").to_i
# binding.pry
      clients.push(Client.new(name: name, id: id))
    end
    clients
  end

end














#
