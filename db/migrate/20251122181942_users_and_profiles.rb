class UsersAndProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.references :space, null: false, foreign_key: true

      t.timestamps
    end
    add_index :users, [:space_id, :name], unique: true
    add_index :users, [:space_id, :email], unique: true

    create_table :profiles do |t|
      t.string :name, null: false
      t.text :bio, null: false, default: ''
      t.references :space, null: false, foreign_key: true

      t.timestamps
    end
    add_index :profiles, [:space_id, :name], unique: true

    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
    end
  end
end
