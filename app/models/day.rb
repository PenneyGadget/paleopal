class Day < ActiveRecord::Base
  belongs_to :user
  has_many :entries
  accepts_nested_attributes_for :entries
end
