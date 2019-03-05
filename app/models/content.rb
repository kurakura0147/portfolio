class Content < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy

  def like_user(user_id)
    likes.find_by(user_id: user.id)
  end

end
