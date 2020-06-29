class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :article, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
