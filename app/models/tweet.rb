class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable
  has_rich_text :content
end
