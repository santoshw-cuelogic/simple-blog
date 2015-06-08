class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :subject
      t.text :description
      t.boolean :status
      t.date :posted_at

      t.timestamps
    end
  end
end
