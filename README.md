##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.6.3](https://github.com/organization/project-name/blob/master/.ruby-version#L1)
- Rails [6.1.0](https://github.com/organization/project-name/blob/master/Gemfile#L7)
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
