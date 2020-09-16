class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :post_id
      t.string :text

      t.timestamps
    end
  end
end
