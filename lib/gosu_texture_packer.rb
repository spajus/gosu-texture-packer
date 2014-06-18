require 'gosu'
require 'gosu_texture_packer/version'
require 'gosu_texture_packer/tileset'

module Gosu
  module TexturePacker
    def self.load_json(window, path)
      Tileset.load_json(window, path)
    end
  end
end
