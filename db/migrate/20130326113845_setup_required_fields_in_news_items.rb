class SetupRequiredFieldsInNewsItems < ActiveRecord::Migration
  def change
    change_column :news_items, :title, :string, null: false
    change_column :news_items, :url_key, :string, null: false
  end
end
