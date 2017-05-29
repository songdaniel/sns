class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.belongs_to :user
      t.timestamps
    end
  end

  #add_index :posts, :user_id == t.belongs_to :user
end
