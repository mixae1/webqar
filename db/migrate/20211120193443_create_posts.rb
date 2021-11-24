class CreatePosts < ActiveRecord::Migration[6.1]
  def up
    create_table :posts do |t|
      t.belongs_to :user, null: false
      t.string :title, null: false
      t.text :text, null: false
      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
