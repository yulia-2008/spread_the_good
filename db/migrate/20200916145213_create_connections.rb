class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.integer :help_seeker_id
      t.integer :helper_id

      t.timestamps
    end
  end
end
