class DeleteSomeColumnsInTaggings < ActiveRecord::Migration[5.0]
  def change
  	remove_column :taggings, :tagger_type
  	remove_column :taggings, :tagger_id
  end
end