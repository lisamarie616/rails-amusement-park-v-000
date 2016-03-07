class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      message = "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      message = "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif user.height < attraction.min_height
      message = "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.update(tickets: user.tickets - attraction.tickets, nausea: user.nausea + attraction.nausea_rating, happiness: user.happiness + attraction.happiness_rating)
      message = "Thanks for riding the #{attraction.name}!"
    end
    message
  end
end
