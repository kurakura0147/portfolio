class Like < ApplicationRecord
  belongs_to :user
  belongs_to :content, counter_cache: :likes_count
end
