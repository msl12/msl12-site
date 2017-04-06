class AddViewCountToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :view_count, :integer, default: 0
  end
end