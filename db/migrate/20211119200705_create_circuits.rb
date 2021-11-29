class CreateCircuits < ActiveRecord::Migration[6.1]
  def up
    create_table :circuits do |t|
      t.belongs_to :user, null: false
      t.string :title, null: false
      t.text :description
      t.text :scheme
      t.boolean :published, null: false, default: false
      t.timestamps
    end
  end

  def down
    drop_table :circuits
  end
end
