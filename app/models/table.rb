class Table < ActiveRecord::Base
  has_many :comments
  has_many :reservations
  has_many :users, :through => :comments

   def self.open_time
    11
  end

  def self.close_time
    20
  end

  def self.time_between
    30.minutes
  end

  def self.reservation_time
    times = []
    time = DateTime.now
    time = time.at_beginning_of_day
    time += open_time.hours
    while time.hour<=close_time
      times<<time.to_s(:long)
      time+=time_between
    end
    times
  end


end
