class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.date :date                    , null: false
      t.text :training_menu           , null: false
      t.text :purpose                 , null: false
      t.text :introspection  
      t.timestamps
    end
  end
end
