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

  describe '#frame' do
    subject(:loaded_frame) { instance.frame(target_frame) }

    it 'loads' do
      expect { subject }.to_not raise_error
    end

    # {"frame"=>{"x"=>129, "y"=>0, "w"=>32, "h"=>32}, "rotated"=>false, "trimmed"=>false,
    # "spriteSourceSize"=>{"x"=>0, "y"=>0, "w"=>32, "h"=>32}, "sourceSize"=>{"w"=>32, "h"=>32}}
    it 'produces a Gosu::Image' do
      should be_a(Gosu::Image)
    end

    it 'produces correctly sized image' do
      expect(loaded_frame.width).to be instance.send(:frames)[target_frame]['frame']['w']
    end

    it 'caches the image' do
      expect(instance.frame(target_frame)).to eq instance.frame(target_frame)
    end

  end
end
