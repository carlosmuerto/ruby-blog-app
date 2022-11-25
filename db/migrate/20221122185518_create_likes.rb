class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, primary_key: [:posts_id, :users_id] do |t|
      t.timestamps
			t.references :posts, foreign_key: true
			t.references :users, foreign_key: true
    end

		add_index(:likes, [:posts_id, :users_id], unique: true)
		add_index(:likes, [:users_id, :posts_id], unique: true)
  end
end
