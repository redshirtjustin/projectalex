class AddSubjectToStories < ActiveRecord::Migration
  def change
    add_column :stories, :subject, :string
  end
end
