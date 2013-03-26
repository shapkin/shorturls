class AddUrlKeyToNewsItems < ActiveRecord::Migration
  def change
    add_column :news_items, :url_key, :string

    add_index :news_items, :url_key, unique: true
  end
end
