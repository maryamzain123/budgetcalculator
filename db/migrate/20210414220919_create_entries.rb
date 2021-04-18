class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    
    create_table :entries do |t|
      t.string :subject
      t.string :details
      t.string :month
      t.integer :user_id
      t.float :amount
    end
  end
end
