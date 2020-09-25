class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :helper_id
      t.string :title
      t.string :description
      t.string :image
      t.boolean :active

      t.timestamps
    end
  end
end
