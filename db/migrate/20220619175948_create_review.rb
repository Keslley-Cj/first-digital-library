class CreateReview < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews, id: :uuid do |t|
      t.string :note
      t.string :comment
      t.references :book, null: false, type: :uuid, foreign_key: { on_update: :cascade, on_delete: :cascade }
      t.timestamps
    end
  end
end
