class CreateMeetupTable < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.integer :organizer, null: false
      t.string :place, null: false
      t.text :description, null: false
    end
  end
end
