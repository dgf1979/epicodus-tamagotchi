class Tamagotchi
  @name
  @food_level
  @sleep_level
  @activity_level

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @birthday = Time.new()
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
    @food_level -= 1
    @sleep_level -= 1
    @activity_level -= 2
  end

  define_method(:set_food_level) do |new_food_level|
    @food_level = new_food_level
  end

  define_method(:set_sleep_level) do |new_sleep_level|

  end

  define_method(:is_alive?) do
    @food_level > 0
  end

  define_method(:feed_it) do
    @food_level += 1
  end

  define_method(:sleep) do
    @sleep_level += 4
    @food_level -= 2
  end

  define_method(:play) do
    @activity_level += 1.5
    @food_level -= 2.5
  end

  define_method(:status) do
    status_codes = {1 => "hungry"}
    if food_level < 3
      @name + "is" + status_codes.fetch(1)
    end
  end

end
