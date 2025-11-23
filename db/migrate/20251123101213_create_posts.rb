class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.text :content, null: false, default: ''
      t.references :profile, null: false, foreign_key: true
      t.references :feed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
