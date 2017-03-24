class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :rating
      t.belongs_to :deck
      t.belongs_to :user
      t.timestamps
    end
  end
end
