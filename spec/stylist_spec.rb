#TODO: test
  #name
  #.all
  #save
  #delete
  #get_clients
  #update:
    #remove_client
    #add_client

require('spec_helper')

describe(Stylist) do
  describe('#name') do
    it('sets and gets the stylists name') do
      stylist = Stylist.new(name: "Mel")
      expect(stylist.name).to eq("Mel")
      stylist.name = "Jane"
      expect(stylist.name).to eq("Jane")
    end
  end

  describe('.all') do
    it('is initially empty') do
      expect(Stylist.all).to eq([])
    end
  end

  describe('#save') do
    it('returns the id of a saved stylist') do
      mel = Stylist.new(name: "Mel")
      expect(mel.save).to eq(mel.id)
    end
  end

  describe('#save and .all') do
    it('adds a stylist to the DB and returns an array of all the stylists') do
      mel = Stylist.new(name: "Mel")
      mel.save
      expect(Stylist.all).to eq([mel])
    end
  end
end
