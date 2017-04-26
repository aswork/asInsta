class CreatePicts < ActiveRecord::Migration
  def change
    create_table :picts do |t|
       t.string :picture
       t.text :content

      t.timestamps null: false
    end
  end
end
