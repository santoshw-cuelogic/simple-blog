class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.string :guest_name
      t.string :guest_email
      t.text :comment
      t.date :comment_date

      t.timestamps
    end
  end
end
