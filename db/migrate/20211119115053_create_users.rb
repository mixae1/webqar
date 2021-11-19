class CreateUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :users do |t|
      t.string :email, :name, :password
      # t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
