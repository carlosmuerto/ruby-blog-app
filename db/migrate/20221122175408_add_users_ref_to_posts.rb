class AddUsersRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :users, null: false, foreign_key: {on_delete: :nullify}
  end
end
