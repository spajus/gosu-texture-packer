# gosu_texture_packer

[![Gem Version](https://badge.fury.io/rb/gosu_texture_packer.svg)](http://badge.fury.io/rb/gosu_texture_packer)
[![Code Climate](https://codeclimate.com/github/spajus/gosu-texture-packer.png?branch=master)](https://codeclimate.com/github/spajus/gosu-texture-packer)

Ruby gem that provides [Texture Packer](http://www.codeandweb.com/texturepacker) support for [Gosu](https://github.com/jlnr/gosu) game engine.

## Installation

Add this line to your application's Gemfile:

    gem 'gosu_texture_packer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gosu_texture_packer

## Usage

```ruby
tileset = Gosu::TexturePacker.load_json(gosu_window, '/path/to/tileset.json')
frame_names = tileset.frame_list
tile = tileset.frame(frame_names.first)
tile.draw(0, 0, 0) # tile is Gosu::Image
```

You may find that your tiles have "bleeding edges" when you stack them together. To avoid that,
either use `--extrude 1` or `--reduce-border-artifacts` when exporting Texture Packer tileset, or
provide `:precise` mode parameter to `load_json`:

```ruby
tileset = Gosu::TexturePacker.load_json(gosu_window, '/path/to/tileset.json', :precise)
```

However, loading with `:precise` mode will significantly increase memory consumption and reduce
load time, so use it carefully.

## Example Code

Run
[examples/tile_brush.rb](https://github.com/spajus/gosu-texture-packer/blob/master/examples/tile_brush.rb) or [examples/random_map.rb](https://github.com/spajus/gosu-texture-packer/blob/master/examples/random_map.rb)
to see `gosu_texture_packer` in action.

Example tilesets are loaded from
[spec/files](https://github.com/spajus/gosu-texture-packer/tree/master/spec/files) directory.

![Gosu TexturePacker Example](https://raw.githubusercontent.com/spajus/gosu-texture-packer/master/examples/screenshots/tile_brush.png)

![Gosu TexturePacker Example](https://raw.githubusercontent.com/spajus/gosu-texture-packer/master/examples/screenshots/random_map.png)

## Contributing

0. Read [CONTRIBUTING.md](https://github.com/spajus/gosu-texture-packer/blob/master/CONTRIBUTING.md)
1. Fork it ( https://github.com/spajus/gosu-texture-packer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
