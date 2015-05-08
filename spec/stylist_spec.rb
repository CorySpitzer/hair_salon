#TODO: test
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

  describe('#==') do
    #TODO?: add comparison of ids?
    it('returns true if the names are equal') do
      mel = Stylist.new(name: "Mel")
      mel_2 = Stylist.new(name: "Mel")
      expect(mel.==(mel_2)).to eq(true)
    end
  end

  describe('#save, .all, and #==') do
    it('adds a stylist to the DB and returns an array of all the stylists') do
      mel = Stylist.new(name: "Mel")
      mel.save
      expect(Stylist.all).to eq([mel])
    end
  end

  describe('#delete') do
    it('deletes an entry from the DB') do
      mel = Stylist.new(name: "Mel")
      mel.save
      mel.delete
      expect(Stylist.all).to eq([])
    end
  end

  describe('#get_clients') do

  end

end
