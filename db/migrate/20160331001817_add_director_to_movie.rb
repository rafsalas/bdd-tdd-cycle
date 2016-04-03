class AddDirectorToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :director, :string, :limit => 25
  end
end
