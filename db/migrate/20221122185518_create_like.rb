class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, primary_key: [:post_id, :user_id] do |t|
      t.timestamps
			t.references :post, foreign_key: true
			t.references :user, foreign_key: true
    end

		add_index(:likes, [:post_id, :user_id], unique: true)
		add_index(:likes, [:user_id, :post_id], unique: true)
  end
end
