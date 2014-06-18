require 'spec_helper'

RSpec.describe Gosu::TexturePacker::Tileset do

  let(:tileset_class) { Gosu::TexturePacker::Tileset }
  let(:media_dir) { File.join(File.dirname(__FILE__), '..', 'files') }
  let(:game_window) { Gosu::Window.new(640, 480, false) }
  let(:target_frame) { 'alientech.png' }
  let(:tileset) { File.join(media_dir, '_UI.json') }

  subject(:instance) do
    tileset_class.load_json(game_window, tileset)
  end

  describe '#load_json' do
    it 'loads existing file' do
      expect { subject }.to_not raise_error
    end
  end

  describe '#frame_list' do
    subject(:frame_list) { instance.frame_list }

    it 'contains all the frames' do
      expect(frame_list.size).to be 514
    end

    it 'includes target frame' do
      expect(frame_list).to include target_frame
    end
  end

  # Frame format in JSON:
  # {"frame"=>{"x"=>129, "y"=>0, "w"=>32, "h"=>32}, "rotated"=>false, "trimmed"=>false,
  # "spriteSourceSize"=>{"x"=>0, "y"=>0, "w"=>32, "h"=>32}, "sourceSize"=>{"w"=>32, "h"=>32}}
  describe '#frame' do
    subject(:loaded_frame) { instance.frame(target_frame) }
    let(:source_size) { instance.send(:frames)[target_frame]['sourceSize'] }

    it 'loads' do
      expect { subject }.to_not raise_error
    end

    it 'produces a Gosu::Image' do
      should be_a(Gosu::Image)
    end

    it 'produces correctly sized image' do
      expect(loaded_frame.width).to be source_size['w']
      expect(loaded_frame.height).to be source_size['h']
    end

    it 'caches the image' do
      expect(instance.frame(target_frame)).to eq instance.frame(target_frame)
    end
  end
end
