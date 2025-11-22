class CreateSpaces < ActiveRecord::Migration[8.1]
  def change
    create_table :spaces do |t|
      t.string :host, null: false
      t.string :title, null: false, default: ''
      t.string :mode, null: false, default: 'public'

      t.timestamps
    end
    add_index :spaces, :host, unique: true
  end
end
