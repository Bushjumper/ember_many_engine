class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors, id: :uuid do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
