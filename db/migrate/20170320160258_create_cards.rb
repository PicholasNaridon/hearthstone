class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :cardId
      t.string :name
      t.string :cardSet
      t.string :cardType
      t.string :faction
      t.string :rarity
      t.integer :cost
      t.text :text
      t.text :flavor
      t.string :artist
      t.boolean :collectible
      t.string :playerClass
      t.string :howToGet
      t.string :howToGetGold
      t.string :img
      t.string :imgGold
      t.string :locale

    end
  end
end
