class Stylist
  attr_accessor :name
  attr_reader :id

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

end
