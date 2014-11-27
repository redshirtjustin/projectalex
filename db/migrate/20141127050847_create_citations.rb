class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.belongs_to :atom
      t.string :citation_url
      t.string :citation_source
      t.string :citation_date

      t.timestamps
    end
  end
end
