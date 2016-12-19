class DeleteTaggingsCountInTags < ActiveRecord::Migration[5.0]
  def change
  	remove_column :tags, :taggings_count
  	remove_index :tags, ["name"]
  end
end