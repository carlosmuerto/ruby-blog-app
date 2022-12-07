# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras posuere, diam eu tempor gravida, tellus nibh accumsan ligula, at efficitur neque nibh at tellus. Nullam ante ex, lobortis sit amet odio ac, fermentum cursus est. Quisque ornare dapibus metus in eleifend. Ut luctus erat eget mauris egestas porta. Suspendisse potenti. Curabitur malesuada nunc ex, ac tincidunt purus eleifend nec. Nunc nisi orci, bibendum sit amet orci ac, tempus tristique libero. Proin tempor convallis lectus, sed fringilla ex finibus vulputate."

big_lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a urna fringilla, cursus elit non, sagittis quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed et urna vel ante ultrices volutpat et sed risus. Aenean vestibulum urna a metus vestibulum, sit amet ornare dui mollis. Pellentesque tincidunt congue lorem quis scelerisque. Aenean pellentesque ornare justo sed molestie. Vestibulum sagittis eget tortor tincidunt cursus. Nunc ac scelerisque nulla. Aliquam molestie laoreet consectetur. Integer viverra nunc at diam accumsan vehicula.\nPraesent porta, urna eu consectetur tempor, enim metus porttitor nibh, non hendrerit orci dui eu ligula. Maecenas posuere lorem nec mollis iaculis. Suspendisse in lorem urna. Nullam sollicitudin erat et eleifend tristique. Duis in libero orci. Aliquam quis convallis erat, non cursus erat. Morbi non massa nec orci mollis efficitur. Nunc varius nulla sed nisl ultrices dictum. Nullam lacinia nisl ac lacinia laoreet. Praesent venenatis sapien ut risus ultricies, ac fringilla odio tincidunt. Aliquam nec pretium augue. Nulla laoreet mattis mauris, a mattis dui feugiat sed. Aliquam eros dolor, feugiat sit amet maximus et, aliquet viverra mi. Suspendisse potenti. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;\nQuisque consectetur quam placerat enim lacinia, ac commodo lorem rhoncus. Cras enim elit, egestas at commodo nec, molestie sed ante. Morbi at venenatis ipsum. Pellentesque varius ac urna quis mattis. Cras accumsan libero a dui sodales condimentum. Cras placerat lacus ut nunc condimentum, sit amet laoreet augue suscipit. Duis sed eleifend neque, et lobortis orci."

alicia_user = User.new(
  name: 'Alicia Addy',
  photo: 'https://randomuser.me/api/portraits/women/65.jpg',
  bio: lorem_ipsum,
  email: 'Alicia_Addy@test.com',
  password: 'alicia_addy_pass'
)
alicia_user.skip_confirmation!
alicia_user.save

scott_user = User.new(
  name: 'Scott Wells',
  photo: 'https://randomuser.me/api/portraits/men/46.jpg',
  bio: lorem_ipsum,
  email: 'Scott_Wells@test.com',
  password: 'scott_wells_pass'
)
scott_user.skip_confirmation!
scott_user.save

ella_user = User.new(
  name: 'Ella Green',
  photo: 'https://randomuser.me/api/portraits/women/55.jpg',
  bio: lorem_ipsum,
  email: 'Ella_Green@test.com',
  password: 'ella_green_pass'
)
ella_user.skip_confirmation!
ella_user.save

emine_user = User.new(
  name: 'Emine Zwick',
  photo: 'https://randomuser.me/api/portraits/women/76.jpg',
  bio: lorem_ipsum,
  email: 'Emine_Zwick@test.com',
  password: 'emine_zwick_pass'
)
emine_user.skip_confirmation!
emine_user.save

maxime_user = User.new(
  name: 'Maxime Boyer',
  photo: 'https://randomuser.me/api/portraits/men/30.jpg',
  bio: lorem_ipsum,
  email: 'Maxime_Boyer@test.com',
  password: 'maxime_boyer_pass'
)
maxime_user.skip_confirmation!
maxime_user.save

luise_user = User.new(
  name: 'Luise Yilmaz',
  photo: 'https://randomuser.me/api/portraits/women/74.jpg',
  bio: lorem_ipsum,
  email: 'Luise_Yilmaz@test.com',
  password: 'luise_yilmaz_pass'
)
luise_user.skip_confirmation!
luise_user.save

hans_user = User.new(
  name: 'Hans-Heinrich Euler',
  photo: 'https://randomuser.me/api/portraits/men/85.jpg',
  bio: lorem_ipsum,
  email: 'Hans-Heinrich_Euler@test.com',
  password: 'hans-heinrich_euler_pass'
)
hans_user.skip_confirmation!
hans_user.save

nikolaj_user = User.new(
  name: 'Nikolaj Larsen',
  photo: 'https://randomuser.me/api/portraits/men/5.jpg',
  bio: lorem_ipsum,
  email: 'Nikolaj_Larsen@test.com',
  password: 'nikolaj_larsen_pass'
)
nikolaj_user.skip_confirmation!
nikolaj_user.save

felix_user = User.new(
  name: 'Felix Lavoie',
  photo: 'https://randomuser.me/api/portraits/men/1.jpg',
  bio: lorem_ipsum,
  email: 'Felix_Lavoie@test.com',
  password: 'felix_lavoie_pass'
)
felix_user.skip_confirmation!
felix_user.save

noah_user = User.new(
  name: 'Noah Knight',
  photo: 'https://randomuser.me/api/portraits/men/39.jpg',
  bio: lorem_ipsum,
  email: 'Noah_Knight@test.com',
  password: 'noah_knight_pass'
)
noah_user.skip_confirmation!
noah_user.save

ramon_user = User.new(
  name: 'Ramon Reyes',
  photo: 'https://randomuser.me/api/portraits/men/38.jpg',
  bio: lorem_ipsum,
  email: 'Ramon_Reyes@test.com',
  password: 'ramon_reyes_pass'
)
ramon_user.skip_confirmation!
ramon_user.save

Post.create(
  author: scott_user,
  title: 'Ut arcu sapien, pellentesque scelerisque. ',
  text: big_lorem_ipsum
)

Post.create(
  author: scott_user,
  title: 'Sed maximus dictum ultrices. Quisque molestie.',
  text: big_lorem_ipsum
)

Post.create(
  author: scott_user,
  title: 'Donec commodo magna vel tortor cursus.',
  text: big_lorem_ipsum
)

Post.create(
  author: ella_user,
  title: 'Nunc neque tellus, pulvinar volutpat tellus.',
  text: big_lorem_ipsum
)

Post.create(
  author: ella_user,
  title: 'Interdum et malesuada.',
  text: big_lorem_ipsum
)

Comment.create(author: ella_user, post: scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: alicia_user, post: scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: emine_user, post: scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: maxime_user, post: scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: luise_user, post: scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: hans_user, post: scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: nikolaj_user, post: scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: felix_user, post: scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: noah_user, post: scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: ramon_user, post: scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: scott_user, post: scott_user.posts[2], text: 'THANKS EVERYONE')

Comment.create(author: nikolaj_user, post: scott_user.posts[1], text: 'Hi Scott!')
Comment.create(author: felix_user, post: scott_user.posts[1], text: 'Hi Scott!')

Comment.create(author: alicia_user, post: scott_user.posts[0], text: 'Hi Scott!')
Comment.create(author: emine_user, post: scott_user.posts[0], text: 'Hi Scott!')

Comment.create(author: emine_user, post: ella_user.posts[1], text: 'Hi Ellan!')
Comment.create(author: luise_user, post: ella_user.posts[1], text: 'Hi Ellan!')

Comment.create(author: hans_user, post: ella_user.posts[0], text: 'Hi Ellan!')
Comment.create(author: maxime_user, post: ella_user.posts[0], text: 'Hi Ellan!')
