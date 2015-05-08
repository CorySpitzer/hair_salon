class Client
  attr_accessor :name, :stylist_id, :id

  #TODO: .find

  def initialize(attributes)
    @name = attributes.fetch(:name)
    if attributes.has_key?(:stylist_id)
      @stylist_id = attributes.fetch(:stylist_id)
    else
      @stylist_id = nil
    end
    if attributes.has_key?(:id)
      @id = attributes.fetch(:id)
    else
      @id = nil
    end
  end

  def self.all
    clients = []
    returned_clients = DB.exec("SELECT * FROM clients;")
    returned_clients.each do |client| #client is a pg object
      name = client.fetch("name")
      id = client.fetch("id").to_i
      stylist_id = client.fetch("stylist_id")
      clients.push(Client.new(name: name, id: id, stylist_id: stylist_id))
    end
    clients
  end

  def save
    # Write self into the DB and
    # return the id from the DB
    pg_result = DB.exec("INSERT INTO clients (name)
                         VALUES ('#{@name}') RETURNING id;")
    @id = pg_result[0].fetch('id').to_i
  end

  def ==(other)
    self.name == other.name
  end

end
