class CreateGameComments < ActiveRecord::Migration[6.0]
  def change
    create_table :game_comments do |t|
      t.integer            :user_id
      t.integer            :game_id
      t.text               :text
      t.timestamps
    end
  end
end
