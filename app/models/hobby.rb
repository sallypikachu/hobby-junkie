class Hobby < ActiveRecord::Base
  validates :name, presence: true
end
