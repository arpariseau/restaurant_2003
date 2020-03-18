class Restaurant
  attr_reader :opening_time, :name, :dishes

  def initialize(time, name)
    @opening_time = time
    @name = name
    @dishes = []
  end

  def closing_time(time)
    clock = @opening_time.delete_suffix(":00").to_i
    clock += time
    if clock > 24
      clock -= 24
    end
    return clock.to_s + ":00"
  end

  def add_dish(dish)
    @dishes << dish
  end

  def open_for_lunch?
    @opening_time.delete_suffix(":00").to_i < 12
  end

  def menu_dish_names
    allcapsdishes = []
    @dishes.each do |dish|
      allcapsdishes << dish.upcase
    end
    return allcapsdishes
  end

  def announce_closing_time(time)
    clock = @opening_time.delete_suffix(":00").to_i
    clock += time
    if clock > 24
      clock -= 24
    end
    if clock > 12
      clock -= 12
      return "#{@name} will be closing at #{clock}:00PM"
    else
      return "#{@name} will be closing at #{clock}:00AM"
    end
  end

end
