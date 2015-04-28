require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
require('pry')
also_reload('lib/**/*.rb')

get('/test') do
  erb(:test)
end

get('/') do

  if Tamagotchi.length == 0
    pet = Tamagotchi.new("Lil Gem")
    pet.new_pet()
  end

  @pet = Tamagotchi.all()

  if params.length > 0
    @pet.time_passes()

    action = params.fetch("action")

    if action == "nofood"
      @pet.set_food_level(0)
    elsif action == "nosleep"
      @pet.set_sleep_level(0)
    elsif action == "sleep"
      @pet.sleep()
    elsif action == "feed"
      @pet.feed_it()
    elsif action == "play"
      @pet.play()
    elsif action == "newpet"
      Tamagotchi.clear()
      pet = Tamagotchi.new("Lil Ruby")
      pet.new_pet()
      @pet = Tamagotchi.all()
    end

  end

  @food_level = @pet.food_level()
  @sleep_level = @pet.sleep_level()
  @activity_level = @pet.activity_level()
  if @pet.is_alive?()
    @status = @pet.status()
  else
    @status = @pet.name() + " is dead!"
  end
  #binding.pry
  erb(:index)
end
