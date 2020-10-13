class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.string :plan
      t.date :date
      t.timestamps
    end
  end
end
