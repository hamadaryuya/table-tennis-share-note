class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.date :date                    , null: false
      t.text :training_menu           
      t.text :purpose                 
      t.text :introspection           
      t.text :opponent                
      t.text :result
      t.text :good_point
      t.text :game_introspection
      t.references    :user           , foreign_key: true
      t.timestamps
    end
  end
end
