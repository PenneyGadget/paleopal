class Entry < ActiveRecord::Base
  belongs_to :day
  belongs_to :user
  validates_presence_of :date
  validates_presence_of :meal
  validates_presence_of :ingredients
end
