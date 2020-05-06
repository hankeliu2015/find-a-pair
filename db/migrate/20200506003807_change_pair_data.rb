class ChangePairData < ActiveRecord::Migration[5.2]
  def change
    add_column :pairs, :description, :text
    rename_column :pairs, :topic, :title
  end
end
