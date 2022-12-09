class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.timestamps
			t.references :posts, foreign_key: {on_delete: :cascade}
			t.references :users, foreign_key: {on_delete: :cascade}
    end

		add_index(:likes, [:posts_id, :users_id], unique: true)
		add_index(:likes, [:users_id, :posts_id], unique: true)
  end
end
