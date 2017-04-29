class AddUserIdToPicts < ActiveRecord::Migration
  def change
    add_column :picts, :user_id, :integer
  end
end
