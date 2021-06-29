class CreateAbouts < ActiveRecord::Migration[6.0]
  def change
    create_table :abouts do |t|
      t.text :privacy
      t.text :welcome
      t.text :thank_you
      t.text :terms_and_condition

      t.timestamps
    end
  end
end
