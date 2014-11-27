class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :sec_name

      t.timestamps
    end
  end
end
