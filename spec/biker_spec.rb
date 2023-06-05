require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
  it "exists and has attributes" do
    biker = Biker.new("Kenny", 30)

    expect(biker.name).to eq("Kenny")
    expect(biker.max_distance).to eq(30)
    expect(biker.rides).to eq({})
    expect(biker.acceptable_terrain).to eq([])
  end

  it "can learn terrains" do
    biker = Biker.new("Kenny", 30)

    expect(biker.acceptable_terrain).to eq([])
    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)
    expect(biker.acceptable_terrain).to eq([:gravel, :hills])
  end

  it "can log rides/order them" do
    biker = Biker.new("Kenny", 30)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)

    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)
    biker.log_ride(ride2, 60.9)
    biker.log_ride(ride2, 61.6)

    expect(biker.rides).to be_an_instance_of(Hash)
    expect(biker.personal_record(ride1)).to eq(91.1)
    expect(biker.personal_record(ride2)).to eq(60.9)
  end

  it "can only log rides on learned terrain" do
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    biker2 = Biker.new("Athena", 15)

    biker2.log_ride(ride1, 97.0)
    # require 'pry'; binding.pry
    biker2.log_ride(ride2, 67.0)
    expect(biker2.rides).to eq({})

    biker2.learn_terrain!(:gravel)
    biker2.learn_terrain!(:hills)

    biker2.log_ride(ride1, 95.0)
    biker2.log_ride(ride2, 65.0)

    expect(biker2.rides).to eq(ride2 => [65.0])
    expect(biker2.personal_record(ride2)).to eq(65.0)
    expect(biker2.personal_record(ride1)).to eq(false)
  end
end