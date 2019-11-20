class RenameUserTable < ActiveRecord::Migration[5.2]
  def up
    rename_table :users, :contributors
    rename_table :user_edits, :contributor_edits
  end

  def down
    rename_table :contributors, :users
    rename_table :contributor_edits, :user_edits
  end
end
