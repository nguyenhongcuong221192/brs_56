class Book < ApplicationRecord

  has_many :reviews, dependent: :destroy
  has_many :marks, dependent: :destroy
  has_many :historys, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :ratings, dependent: :destroy

end
