class CreatePublishedCircuits < ActiveRecord::Migration[6.1]
  def up
    create_table :published_circuits do |t|
      t.references :circuit
      t.timestamps
    end
  end

  def down
    drop_table :published_circuits
  end
end
