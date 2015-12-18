class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|

      t.timestamps null: false
    end
  end
end
