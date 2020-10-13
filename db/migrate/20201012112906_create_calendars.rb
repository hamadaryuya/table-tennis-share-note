class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.text :training_menu           , null: false
      t.text :purpose                 , null: false
      t.text :introspection           , null: false
      t.date :date                    , null: false
      t.timestamps
    end
  end
end
