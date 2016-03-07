class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    enough_tickets, tall_enough = meet_requirements
    if enough_tickets && tall_enough
      start_ride
    elsif tall_enough && !enough_tickets
      "Sorry. #{ticket_issue}"
    elsif enough_tickets && !tall_enough
      "Sorry. #{height_issue}"
    else
      "Sorry. #{ticket_issue} #{height_issue}"
    end
  end

  def meet_requirements
    enough_tickets, tall_enough = false
    if user.tickets >= attraction.tickets
      enough_tickets = true
    end
    if user.height >= attraction.min_height
      tall_enough = true
    end
    return [enough_tickets, tall_enough]
  end

  def start_ride
    user.update(tickets: user.tickets - attraction.tickets, nausea: user.nausea + attraction.nausea_rating, happiness: user.happiness + attraction.happiness_rating)
    "Thanks for riding the #{attraction.name}!"
  end

  def ticket_issue
    "You do not have enough tickets the #{attraction.name}."
  end

  def height_issue
    "You are not tall enough to ride the #{attraction.name}."
  end
end
