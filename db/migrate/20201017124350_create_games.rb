class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.date :date                    , null: false
      t.text :opponent                , null: false
      t.text :result                  
      t.text :good_point
      t.text :game_introspection
      t.references    :user           , foreign_key: true
      t.timestamps
    end
  end
end
