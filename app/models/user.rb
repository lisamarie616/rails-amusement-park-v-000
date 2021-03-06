class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if nausea
      nausea > happiness ? "sad" : "happy"
    end
  end
end
