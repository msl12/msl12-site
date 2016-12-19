class DeleteIndexOnTaggings < ActiveRecord::Migration[5.0]
  def change
  	remove_index :taggings, ["tag_id"]
  	remove_index :taggings, ["taggable_id", "taggable_type", "context"]
  end
end