class CreatePipelines < ActiveRecord::Migration
  def change
    create_table :pipelines do |t|
      t.string :pip_name

      t.timestamps
    end
  end
end
