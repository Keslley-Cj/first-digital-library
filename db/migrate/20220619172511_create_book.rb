class CreateBook < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.timestamps
    end
  end
end
