class Tamagotchi
  @name
  @food_level
  @sleep_level
  @activity_level
  @@pet = []

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @birthday = Time.new()
  end

  define_singleton_method(:length) do
    @@pet.length
  end

  define_singleton_method(:all) do
    @@pet[0]
  end

  define_singleton_method(:clear) do
    @@pet = []
  end

  define_method(:new_pet) do
    @@pet.push(self)
  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food_level
  end

  define_method(:sleep_level) do
    @sleep_level
  end

  define_method(:activity_level) do
    @activity_level
  end

  define_method(:time_passes) do
    if is_alive?()
      @food_level -= 1
      @sleep_level -= 1
      @activity_level -= 2
    end
  end

  define_method(:set_food_level) do |new_food_level|
    @food_level = new_food_level
  end

  define_method(:set_sleep_level) do |new_sleep_level|
    @sleep_level = new_sleep_level
  end

  define_method(:is_alive?) do
    @food_level > 0
  end

  define_method(:feed_it) do
    @food_level += 3
  end

  define_method(:sleep) do
    @sleep_level += 4
    if is_alive?()
      @food_level -= 2
    end
  end

  define_method(:play) do
    @activity_level += 5
    if is_alive?()
      @food_level -= 2.5
    end
  end

  define_method(:status) do
    statuses = []

    if food_level < 3
      statuses.push("hungry")
    end

    if sleep_level < 3
      statuses.push("sleepy")
    end

    if activity_level > 12
      statuses.push("hyper")
    end

    if statuses.length > 0
      return @name + " is " + statuses.join(" and ")
    else
      return @name + " is fine."
    end
  end

end
