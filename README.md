##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.6.3](https://github.com/matheussf/zygobooks/blob/main/.ruby-version#L1)
- Rails [6.1.0](https://github.com/matheussf/zygobooks/blob/main/Gemfile#L7)
- Nodejs [10.23.0]
- Yarn [1.22.5]

##### 1. Check out the repository

```bash
git clone https://github.com/matheussf/zygobooks.git
```

##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle install
rails webpacker:install
rails db:create
rails db:setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000


##### User admins (ability to add/update/remove books)
To login as admin you might follow one of these two steps:

##### 1 - Log in as teste@gmail.com / 123123
##### 2 - Create normal account and go to rails console change User's Role attribute to 0.
```ruby
User.find(1).update_attribute(:role, 0)
```
