class Garden < ApplicationRecord
  has_many :plants # allows us to do garden_instance.plants
end
