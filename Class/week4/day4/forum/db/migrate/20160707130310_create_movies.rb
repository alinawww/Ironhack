class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :string
      t.string :poster
      t.string :string
      t.string :year
      t.string :integer
      t.string :synopsis

      t.timestamps
    end
  end
end
