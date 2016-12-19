class AddSomeColumnsInTaggings < ActiveRecord::Migration[5.0]
  def change
  	add_column :taggings, :tagger_id, :integer
  	add_column :taggings, :tagger_type, :string
  end
end