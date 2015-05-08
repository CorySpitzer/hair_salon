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

  describe('add_client') do
    it('adds a stylist id to the client table') do
      mel = Stylist.new(name: "Mel")
      mel.save
      jane = Client.new(name: "Jane")
      jane.save
      # jane has no id, so we save her to the DB
      # and then recreate her with the same id from the DB
      # This is *super* akward and should be refactored
      id = jane.id
      jane = Client.new(name: "Jane", id: id)
      mel.add_client(jane)
      expect(mel.get_clients).to eq(jane)
    end
  end

  describe('#get_clients') do
    it("returns the stylist's list of clients") do
      client1 = Client.new(name: "Mel")
      client2 = Client.new(name: "Jane")
      client1.save
      client2.save
      #TODO: This test requires the add_client method...
    end
  end

  describe('#remove_client') do
    it('') do

    end
  end
end
