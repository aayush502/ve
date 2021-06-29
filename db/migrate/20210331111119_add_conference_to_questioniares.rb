class AddConferenceToQuestioniares < ActiveRecord::Migration[6.0]
  def change
    add_column :questioniares, :conference, :boolean
  end
end
