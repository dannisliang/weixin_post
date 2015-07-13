class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name
      t.string :url
      t.string :rss
      t.string :content_path
      t.integer :hidden
      t.string :short_name
      t.string :guid
      t.integer :category_id
      t.string :description
      t.datetime :last_parse_time
      t.string :img

      t.timestamps
    end
  end
end
