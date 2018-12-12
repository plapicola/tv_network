class Network

  attr_reader :name,
              :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def highest_paid_actor
    if @shows.empty?
      return nil
    end
    best_paid = @shows.inject(@shows.first.characters.first) do |highest_paid_actor, show|
      show.characters.each do |character|
        if character.salary > highest_paid_actor.salary
          highest_paid_actor = character
        end
      end
      highest_paid_actor
    end
    return best_paid.actor
  end

  def payroll
    @shows.inject({}) do |payroll, show|
      show.characters.each do |character|
        payroll[character.actor] = character.salary
      end
      payroll
    end
  end

end
