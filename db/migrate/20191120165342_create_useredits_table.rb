class CreateUsereditsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :user_edits do |t|
      t.integer :user_id
      t.integer :article_id
      t.timestamps
    end
  end
end
