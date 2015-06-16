class CreateRsvpTable < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.belongs_to :meetup
      t.belongs_to :user
    end
  end
end
