class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :headline
      t.text :leadline
      t.string :shortline
      t.string :mast_url
      t.string :thumb_url
      t.belongs_to :section, index: true
      t.belongs_to :priority, index: true
      t.belongs_to :pipeline, index: true

      t.timestamps
    end
  end
end
