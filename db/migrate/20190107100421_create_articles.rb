class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :content, null: false
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
