class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.date :date
      t.string :title
      t.string :location

      t.timestamps
    end
  end
end
