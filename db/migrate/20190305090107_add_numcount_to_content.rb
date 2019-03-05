class AddNumcountToContent < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :likes_count, :integer
  end
end
