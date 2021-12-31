# TinyDb

The purpose of this gem is provide a very simple solution for storing records locally in a text file as json and providing a basic ActivateRecord like interface to access those records.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tiny_db'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install tiny_db

## Usage

### Initialize:
```ruby
TinyDb.configure do |config|
  config.db_file_path = "your_file_name.json"
end
```

### Create file:
Create a file that matches the `db_file_path` provided above.
`your_file_name.json`
```
{}
```

###
Example usage:
```ruby
class MyModel < TinyDb::FileModel
  TABLE_NAME = "my_model"
  ATTRIBUTES = [:id, :name]
  attr_accessor *ATTRIBUTES
end

```


This snippet:
```ruby
record = MyModel.new
record.name = "Timbo"
record.save
```

Would result in the json file being updated to:
```
{
    "my_model": [
        {
            "id": 1,
            "name": "Timbo"
        }
    ]
}
```

### Methods provided:
- `.new`
- `.create(key: value)`
- `.update(key: value)`
- `.find_by(key: value)`
- `.destroy`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Timothyjb/tiny_db.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
