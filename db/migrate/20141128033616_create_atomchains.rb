class CreateAtomchains < ActiveRecord::Migration
  def change
    create_table :atomchains do |t|
      t.belongs_to :story, index: true
      t.belongs_to :atom, index: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
