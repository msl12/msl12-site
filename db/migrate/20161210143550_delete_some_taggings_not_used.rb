class DeleteSomeTaggingsNotUsed < ActiveRecord::Migration[5.0]
  def change
  	remove_index :taggings, ["context"]
  	remove_index :taggings, ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"]
  	remove_index :taggings, ["taggable_id", "taggable_type", "tagger_id", "context"]
  	remove_index :taggings, ["taggable_type"]
  	remove_index :taggings, ["tagger_id", "tagger_type"]
  	remove_index :taggings, ["tagger_id"]
  end
end