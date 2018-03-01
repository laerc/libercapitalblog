class Article < ApplicationRecord
  # If i delete a comment, all the dependents, must to be destroyed
  has_many :comments, dependent: :destroy
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end