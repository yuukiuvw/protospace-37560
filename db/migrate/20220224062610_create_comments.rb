class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.timestamps
      t.text       :content,        null: false
      t.references :bikes,      null: false,foreign_key: true  
      t.references :user,           null: false,foreign_key: true

    end
  end
end