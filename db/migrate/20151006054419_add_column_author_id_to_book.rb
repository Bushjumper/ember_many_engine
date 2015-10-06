class AddColumnAuthorIdToBook < ActiveRecord::Migration
  def change
    add_column :books, :author_id, :uuid
  end
end
