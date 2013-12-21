class CreateAlbumusers < ActiveRecord::Migration
  def change
    create_table :albumusers do |t|
      t.integer :album_id
      t.integer :user_id

      t.timestamps
    end
  end
end
