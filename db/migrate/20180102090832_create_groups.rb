class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.boolean :is_public, default: true
      t.string :channel_key

      t.timestamps
    end
  end
end