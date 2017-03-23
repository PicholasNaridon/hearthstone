# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

Card.delete_all

cards_path = "#{Rails.root}/public/response.json"
cards = JSON.parse(File.read(cards_path))
cards.each do |key, value|
  value.each do |card|
    Card.create!(
    :cardId => card['cardId'],
    :name => card['name'],
    :cardSet => card['cardSet'],
    :cardType => card['type'],
    :faction => card['faction'],
    :rarity => card['rarity'],
    :cost => card['cost'],
    :text => card['text'],
    :flavor => card['flavor'],
    :artist => card['artist'],
    :collectible => card['collectible'],
    :playerClass => card['playerClass'],
    :howToGet => card['howToGet'],
    :howToGetGold => card['howToGetGold'],
    :img => card['img'],
    :imgGold => card['imgGold'],
    :locale => card['locale']
    )
  end
end
