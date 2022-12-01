### create users

```ruby
User.create(name: 'Alicia Addy', photo: '"https://randomuser.me/api/portraits/women/65.jpg')
User.create(name: 'Scott Wells', photo: 'https://randomuser.me/api/portraits/men/46.jpg')
User.create(name: 'Ella Green', photo: 'https://randomuser.me/api/portraits/women/55.jpg')
User.create(name: 'Emine Zwick', photo: 'https://randomuser.me/api/portraits/women/76.jpg')
User.create(name: 'Maxime Boyer', photo: 'https://randomuser.me/api/portraits/men/30.jpg')
User.create(name: 'Luise Yilmaz', photo: 'https://randomuser.me/api/portraits/women/74.jpg')
User.create(name: 'Hans-Heinrich Euler', photo: 'https://randomuser.me/api/portraits/men/85.jpg')
User.create(name: 'Nikolaj Larsen', photo: 'https://randomuser.me/api/portraits/men/5.jpg')
User.create(name: 'Felix Lavoie', photo: 'https://randomuser.me/api/portraits/men/1.jpg')
User.create(name: 'Noah Knight', photo: 'https://randomuser.me/api/portraits/men/39.jpg')
User.create(name: 'Ramon Reyes', photo: 'https://randomuser.me/api/portraits/men/38.jpg')
```

### create post

```ruby
scott_user = User.find_by_name('Scott Wells')
Ella_user = User.find_by_name('Ella Green')
lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a urna fringilla, cursus elit non, sagittis quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed et urna vel ante ultrices volutpat et sed risus. Aenean vestibulum urna a metus vestibulum, sit amet ornare dui mollis. Pellentesque tincidunt congue lorem quis scelerisque. Aenean pellentesque ornare justo sed molestie. Vestibulum sagittis eget tortor tincidunt cursus. Nunc ac scelerisque nulla. Aliquam molestie laoreet consectetur. Integer viverra nunc at diam accumsan vehicula.\nPraesent porta, urna eu consectetur tempor, enim metus porttitor nibh, non hendrerit orci dui eu ligula. Maecenas posuere lorem nec mollis iaculis. Suspendisse in lorem urna. Nullam sollicitudin erat et eleifend tristique. Duis in libero orci. Aliquam quis convallis erat, non cursus erat. Morbi non massa nec orci mollis efficitur. Nunc varius nulla sed nisl ultrices dictum. Nullam lacinia nisl ac lacinia laoreet. Praesent venenatis sapien ut risus ultricies, ac fringilla odio tincidunt. Aliquam nec pretium augue. Nulla laoreet mattis mauris, a mattis dui feugiat sed. Aliquam eros dolor, feugiat sit amet maximus et, aliquet viverra mi. Suspendisse potenti. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;\nQuisque consectetur quam placerat enim lacinia, ac commodo lorem rhoncus. Cras enim elit, egestas at commodo nec, molestie sed ante. Morbi at venenatis ipsum. Pellentesque varius ac urna quis mattis. Cras accumsan libero a dui sodales condimentum. Cras placerat lacus ut nunc condimentum, sit amet laoreet augue suscipit. Duis sed eleifend neque, et lobortis orci."

Post.create(
  author: scott_user,
  title: 'Ut arcu sapien, pellentesque scelerisque. ',
  text: lorem_ipsum
)

Post.create(
  author: scott_user,
  title: 'Sed maximus dictum ultrices. Quisque molestie.',
  text: lorem_ipsum
)

Post.create(
  author: scott_user,
  title: 'Donec commodo magna vel tortor cursus.',
  text: lorem_ipsum
)

Post.create(
  author: Ella_user,
  title: 'Nunc neque tellus, pulvinar volutpat tellus.',
  text: lorem_ipsum
)

Post.create(
  author: Ella_user,
  title: 'Interdum et malesuada.',
  text: lorem_ipsum
)
```

### create likes

```ruby
# posters
Scott_user = User.find_by_name('Scott Wells')
Ella_user = User.find_by_name('Ella Green')

Alicia_user = User.find_by_name('Alicia Addy')
Emine_user = User.find_by_name('Emine Zwick')
Maxime_user = User.find_by_name('Maxime Boyer')
Luise_user = User.find_by_name('Luise Yilmaz')
Hans_user = User.find_by_name('Hans-Heinrich Euler')
Nikolaj_user = User.find_by_name('Nikolaj Larsen')
Felix_user = User.find_by_name('Felix Lavoie')
Noah_user = User.find_by_name('Noah Knight')
Ramon_user = User.find_by_name('Ramon Reyes')

Like.create(author: Scott_user, post: Ella_user.posts[0])
Like.create(author: Emine_user, post: Ella_user.posts[0])
Like.create(author: Felix_user, post: Ella_user.posts[0])

Like.create(author: Felix_user, post: Ella_user.posts[1])
Like.create(author: Noah_user, post: Ella_user.posts[1])
Like.create(author: Emine_user, post: Ella_user.posts[1])
Like.create(author: Luise_user, post: Ella_user.posts[1])
Like.create(author: Ramon_user, post: Ella_user.posts[1])
Like.create(author: Alicia_user, post: Ella_user.posts[1])

Like.create(author: Ella_user, post: Scott_user.posts[2])
Like.create(author: Alicia_user, post: Scott_user.posts[2])
Like.create(author: Emine_user, post: Scott_user.posts[2])
Like.create(author: Maxime_user, post: Scott_user.posts[2])
Like.create(author: Luise_user, post: Scott_user.posts[2])
Like.create(author: Hans_user, post: Scott_user.posts[2])
Like.create(author: Nikolaj_user, post: Scott_user.posts[2])
Like.create(author: Felix_user, post: Scott_user.posts[2])
Like.create(author: Noah_user, post: Scott_user.posts[2])
Like.create(author: Ramon_user, post: Scott_user.posts[2])

Like.create(author: Felix_user, post: Scott_user.posts[1])
Like.create(author: Noah_user, post: Scott_user.posts[1])
Like.create(author: Ramon_user, post: Scott_user.posts[1])

Like.create(author: Maxime_user, post: Scott_user.posts[0])
Like.create(author: Luise_user, post: Scott_user.posts[0])
Like.create(author: Hans_user, post: Scott_user.posts[0])
```

### create comments

```ruby
# posters
Scott_user = User.find_by_name('Scott Wells')
Ella_user = User.find_by_name('Ella Green')

Alicia_user = User.find_by_name('Alicia Addy')
Emine_user = User.find_by_name('Emine Zwick')
Maxime_user = User.find_by_name('Maxime Boyer')
Luise_user = User.find_by_name('Luise Yilmaz')
Hans_user = User.find_by_name('Hans-Heinrich Euler')
Nikolaj_user = User.find_by_name('Nikolaj Larsen')
Felix_user = User.find_by_name('Felix Lavoie')
Noah_user = User.find_by_name('Noah Knight')
Ramon_user = User.find_by_name('Ramon Reyes')

Comment.create(author: Ella_user, post: Scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: Alicia_user, post: Scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: Emine_user, post: Scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: Maxime_user, post: Scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: Luise_user, post: Scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: Hans_user, post: Scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: Nikolaj_user, post: Scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: Felix_user, post: Scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: Noah_user, post: Scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: Ramon_user, post: Scott_user.posts[2], text: 'Hi Scott!')
Comment.create(author: Scott_user, post: Scott_user.posts[2], text: 'THANKS EVERYONE')

Comment.create(author: Nikolaj_user, post: Scott_user.posts[1], text: 'Hi Scott!')
Comment.create(author: Felix_user, post: Scott_user.posts[1], text: 'Hi Scott!')

Comment.create(author: Alicia_user, post: Scott_user.posts[0], text: 'Hi Scott!')
Comment.create(author: Emine_user, post: Scott_user.posts[0], text: 'Hi Scott!')

Comment.create(author: Emine_user, post: Ella_user.posts[1], text: 'Hi Ellan!')
Comment.create(author: Luise_user, post: Ella_user.posts[1], text: 'Hi Ellan!')

Comment.create(author: Hans_user, post: Ella_user.posts[0], text: 'Hi Ellan!')
Comment.create(author: Maxime_user, post: Ella_user.posts[0], text: 'Hi Ellan!')

```
