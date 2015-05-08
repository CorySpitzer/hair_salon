#TODO: test
  #update
    #stylist
  #delete

require('spec_helper')

describe('#name') do
  it('sets and gets the clients name') do
    client = Client.new(name: "Mel")
    expect(client.name).to eq("Mel")
    client.name = "Jane"
    expect(client.name).to eq("Jane")
  end
end

describe('.all') do
  it('is initially empty') do
    expect(Client.all).to eq([])
  end
end

describe('#save') do
  it('returns the id of a saved client') do
    mel = Client.new(name: "Mel")
    expect(mel.save).to eq(mel.id)
  end
end

describe('#==') do
  #TODO?: add comparison of id's and stylist_id's?
  it('returns true if the names are equal') do
    mel = Client.new(name: "Mel")
    mel_2 = Client.new(name: "Mel")
    expect(mel.==(mel_2)).to eq(true)
  end
end

describe('#save, .all, and #==') do
  it('adds a client to the DB and returns an array of all the clients') do
    jane = Stylist.new(name: "Jane", id: 1)
    mel = Client.new(name: "Mel", stylist_id: jane.id)
    mel.save
    expect(Client.all).to eq([mel])
  end
end
