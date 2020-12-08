class CreateBookUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :book_users do |t|
      t.belongs_to :book
      t.belongs_to :user
      t.text   :review
      
      t.timestamps
    end
  end
end
