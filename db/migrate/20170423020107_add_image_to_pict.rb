class AddImageToPict < ActiveRecord::Migration
  def change
    add_column :picts, :image, :string
  end
end
