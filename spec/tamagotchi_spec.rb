require('rspec')
require('tamagotchi')

describe(Tamagotchi) do
  describe("#initialize") do
    it("sets the name and life levels of a new Tamagotchi") do
      my_pet = Tamagotchi.new("Lil Gem")
      expect(my_pet.name()).to(eq("Lil Gem"))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.sleep_level()).to(eq(10))
      expect(my_pet.activity_level()).to(eq(10))
    end
  end

  describe("#time_passes") do
    it("decreases the amount of food, activity & sleep level the Tamagotchi has left by 1") do
      my_pet = Tamagotchi.new("Lil Gem")
      my_pet.time_passes()
      expect(my_pet.food_level()).to(eq(9))
      expect(my_pet.sleep_level()).to(eq(9))
      expect(my_pet.activity_level()).to(eq(8))
    end
  end

  describe("#is_alive") do
    it("is alive if the food level is above 0") do
      my_pet = Tamagotchi.new("Lil Gem")
      expect(my_pet.is_alive?()).to(eq(true))
    end

    it("is dead if the food level is 0") do
      my_pet = Tamagotchi.new("Lil Gem")
      my_pet.set_food_level(0) #make a method that will change the food level of your tamagotchi.
      expect(my_pet.is_alive?()).to(eq(false))
    end
  end

  describe('#feed_it') do
    it('will increase the food level when the user feeds the pet') do
      my_pet = Tamagotchi.new("Lil Gem")
      my_pet.time_passes()
      my_pet.time_passes()
      my_pet.feed_it()
      expect(my_pet.food_level()).to(eq(9))
    end
  end

  describe('#sleep') do
    it('will increase the sleep level, and decrease the food level') do
      my_pet = Tamagotchi.new("Lil Gem")
      my_pet.sleep()
      my_pet.sleep()
      expect(my_pet.sleep_level()).to(eq(18))
      expect(my_pet.food_level()).to(eq(6))
    end
  end

  describe('#play') do
    it('will increase the activity level, and decrease the food level') do
      my_pet = Tamagotchi.new("Lil Gem")
      my_pet.play()
      my_pet.play()
      expect(my_pet.activity_level()).to(eq(13))
      expect(my_pet.food_level()).to(eq(5))
    end
  end
end
