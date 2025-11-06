class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.references :user, null: false, foreign_key: true, type: :integer

      t.string :title, null: false
      t.text :body, null: false
      t.integer :release, null: false
      t.integer :timeline, null: false
      t.string :tag

      t.timestamps null: false
    end
    
    add_index :posts, :title
    add_index :posts, :release
    add_index :posts, :timeline
    add_index :posts, :tag
  end
end
