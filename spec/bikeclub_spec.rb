require './lib/ride'
require './lib/biker'
require './lib/bikeclub'

RSpec.describe BikeClub do
  it "exists and has attributes" do
    bikeclub = BikeClub.new("coolkats")

    expect(bikeclub.name).to eq("coolkats")
    expect(bikeclub.bikers).to eq([])
  end

  it "add bikers" do
    bikeclub = BikeClub.new("coolkats")
    biker = Biker.new("Kenny", 30)

    bikeclub.add_biker(biker)
    expect(bikeclub.bikers).to eq([biker])
  end

  it "can tell if eligible" do
    bikeclub = BikeClub.new("coolkats")
    biker = Biker.new("Kenny", 30)
    biker2 = Biker.new("Athena", 15)
    bikeclub.add_biker(biker)
    bikeclub.add_biker(biker2)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

    biker2.learn_terrain!(:gravel)
    biker2.learn_terrain!(:hills)

    biker.learn_terrain!(:gravel)

    expect(bikeclub.can_ride(ride1)).to eq(biker2)

   
  end
end