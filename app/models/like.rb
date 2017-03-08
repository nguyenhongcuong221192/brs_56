class Like < ApplicationRecord

  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :marks, dependent: :destroy
  has_many :relationships, dependent: :destroy

end
