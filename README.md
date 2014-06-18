# GosuTexturePacker

[TexturePacker](http://www.codeandweb.com/texturepacker) support for [Gosu](https://github.com/jlnr/gosu) game engine.

## Installation

Add this line to your application's Gemfile:

    gem 'gosu_texture_packer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gosu_texture_packer

## Usage

```ruby
tileset = Gosu::TexturePacker::Tileset.load_json('/path/to/tileset.json')
frame_names = tileset.frame_list
tile = tileset.frame(frame_names.first)
tile.draw(0, 0, 0) # tile is Gosu::Image
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gosu_texture_packer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
