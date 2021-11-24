class CreatePrivateCircuits < ActiveRecord::Migration[6.1]
  def up
    create_table :private_circuits do |t|
      t.belongs_to :user, null: false
      t.string :title, null: false
      t.text :description
      t.text :scheme
      t.timestamps
    end
  end

  def down
    drop_table :private_circuits
  end
end
