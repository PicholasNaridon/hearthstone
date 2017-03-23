class CreateIncludesCards < ActiveRecord::Migration[5.0]
  def change
    create_table :includes_cards do |t|
      t.belongs_to :card
      t.belongs_to :deck
    end
  end
end
