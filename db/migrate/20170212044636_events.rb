class Events < ActiveRecord::Migration
  def change
    add_column :events, :time, :time
    add_column :events, :description, :string
    add_column :events, :image, :string
  end
end
