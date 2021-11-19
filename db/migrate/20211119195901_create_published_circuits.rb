class CreatePublishedCircuits < ActiveRecord::Migration[6.1]
  def up
    create_table :published_circuits do |t|
      t.bigint :circuit_id
      t.timestamps
    end
  end

  def down
    drop_table :published_circuits
  end
end
