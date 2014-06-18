require 'spec_helper'

RSpec.describe Gosu::TexturePacker do

  let(:media_dir) { File.join(File.dirname(__FILE__), 'files') }
  let(:tileset) { File.join(media_dir, '_UI.json') }
  let(:game_window) { Gosu::Window.new(640, 480, false) }

  describe '.load_json' do
    it 'loads existing file' do
      expect { Gosu::TexturePacker.load_json(game_window, tileset) }.to_not raise_error
    end
  end
end
