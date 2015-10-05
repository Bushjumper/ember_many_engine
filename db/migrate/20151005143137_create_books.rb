class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books, id: :uuid do |t|
      t.string :name

      # t.belongs_to :category  /// will use an integer. You'll need to setup you associations like this.
      # t.uuid :category_id
      t.timestamps null: false
    end
  end
end