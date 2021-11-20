class CreatePosts < ActiveRecord::Migration[6.1]
  def up
    create_table :posts do |t|
      t.references :user
      t.string :title
      t.text :text
      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
