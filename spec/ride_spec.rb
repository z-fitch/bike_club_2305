require './lib/ride'



RSpec.describe Ride do
  it "exists and has attributes/cells" do
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

    expect(ride1).to be_an_instance_of(Ride)

    expect(ride1.name).to eq("Walnut Creek Trail")
    expect(ride1.distance).to eq(10.7)
    expect(ride1.terrain).to eq(:hills)
    expect(ride1.loop?).to eq(false)
    expect(ride1.total_distance).to eq(21.4)


    
  end
end