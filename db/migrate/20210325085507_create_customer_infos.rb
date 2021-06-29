class CreateCustomerInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_infos do |t|
      t.date :date_of_birth
      t.string :name
      t.string :email
      t.bigint :contact

      t.timestamps
    end
  end
end
