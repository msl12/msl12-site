class DeleteSomeTagsAndTaggingsNotUsed < ActiveRecord::Migration[5.0]
  def change
  	remove_index :taggings, ["taggable_id"]
  end
end