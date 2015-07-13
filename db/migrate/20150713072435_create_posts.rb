class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, limit: 50
      t.string :url
      t.integer :blog_id
      t.datetime :last_pase_time
      t.integer :hidden, default: 0
      t.string :guid
      t.string :img

      t.timestamps
    end
  end
end
