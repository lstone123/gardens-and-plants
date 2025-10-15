class Plant < ApplicationRecord
  belongs_to :garden

  validates :image_url, :name, presence: true
end
