require 'gosu'
require 'gosu_texture_packer/version'
require 'gosu_texture_packer/tileset'

module Gosu
  module TexturePacker
    def self.load_json(path, mode = :fast)
      Tileset.load_json(path, mode)
    end
  end
end
