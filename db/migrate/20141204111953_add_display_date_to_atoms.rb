class AddDisplayDateToAtoms < ActiveRecord::Migration
  def change
    add_column :atoms, :display_date, :date
  end
end
