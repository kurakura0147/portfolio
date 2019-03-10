class Content < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  acts_as_taggable
  acts_as_taggable_on :tags, :skills
end
