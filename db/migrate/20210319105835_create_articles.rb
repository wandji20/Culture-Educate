class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :author, null: false

      t.timestamps
    end
  end
end
