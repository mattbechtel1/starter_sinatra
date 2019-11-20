class RenameUserIdColumn < ActiveRecord::Migration[5.2]
  def up
    rename_column :contributor_edits, :user_id, :contributor_id
  end

  def down
    rename_column :contributor_edits, :contributor_id, :user_id
  end
end
