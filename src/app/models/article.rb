class Article < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :professors
end
