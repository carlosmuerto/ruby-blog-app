class AddPhotoDefaultValueToUser < ActiveRecord::Migration[7.0]
  def change
		change_column_default :users, :photo, from: nil, to: 'https://randomuser.me/api/portraits/lego/6.jpg'
  end
end
