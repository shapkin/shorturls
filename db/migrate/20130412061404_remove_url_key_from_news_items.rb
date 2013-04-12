class RemoveUrlKeyFromNewsItems < ActiveRecord::Migration
  def up
    remove_column :news_items, :url_key
  end

  def down
    add_column :news_items, :url_key, :string, null: false
  end
end
