class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :name, null: false
      t.timestamps
      t.belongs_to :user, null: false
    end
  end
end
