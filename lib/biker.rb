class Biker
  attr_reader :name, :max_distance, :rides, :acceptable_terrain
  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(data)
    acceptable_terrain << data
  end

  def log_ride(trail, time)
    # require 'pry'; binding.pry
    if acceptable_terrain.include?(trail.terrain) && max_distance > trail.total_distance
      if rides[trail] != nil
        rides[trail] << time
      else
        rides[trail] = []
        rides[trail] << time
      end 
    else 
      false
    end
  end

  def personal_record(trail)
    # require 'pry'; binding.pry
    if rides[trail] != nil
      rides[trail].min
    else
      false
    end
  end
end