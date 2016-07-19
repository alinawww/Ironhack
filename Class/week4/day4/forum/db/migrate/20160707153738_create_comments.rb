class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :username
      t.string :string
      t.string :comment_text
      t.string :string

      t.timestamps
    end
  end
end
