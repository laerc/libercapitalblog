class Article < ApplicationRecord
  # If i delete a comment, all the dependents, must to be destroyed
  has_many :comments, dependent: :destroy
end