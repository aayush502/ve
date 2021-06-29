class CreateQuestioniares < ActiveRecord::Migration[6.0]
  def change
    create_table :questioniares do |t|
      t.integer :customer_id
      t.string :eye
      t.string :symptom
      t.string :duration
      t.text :description

      t.timestamps
    end
  end
end
