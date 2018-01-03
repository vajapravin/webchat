class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.boolean :is_delivered, default: false
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
