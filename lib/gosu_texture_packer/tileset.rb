require 'json'
module Gosu
  module TexturePacker
    class Tileset

      def self.load_json(window, json, mode = :fast)
        self.new(window, json, mode)
      end

      def initialize(window, json, mode)
        @mode = mode
        @window = window
        @json = JSON.parse(File.read(json))
        @source_dir = File.dirname(json)
        @main_image = build_main_image(mode)
        @tile_cache = {}
      end

      def frame_list
        frames.keys
      end

      def frame(name)
        tile = @tile_cache[name]
        unless tile
          data = frames[name]
          unless data
            raise "Missing tile: #{name}. Available: #{frames.keys.join(', ')}"
          end
          f = data['frame']
          tile = build_tile(f)
          raise "Nil tile from name #{name}" unless tile
          @tile_cache[name] = tile
        end
        tile
      end

      private

      def build_main_image(mode)
        case mode
        when :fast
          Gosu::Image.new(@window, image_file, true)
        when :precise
          require 'RMagick' unless defined?(Magick)
          Magick::ImageList.new(image_file).first
        else
          raise "Unsupported mode #{mode}. Use :fast or :precise."
        end
      end

      def build_tile(f)
        if @mode == :fast
          @main_image.subimage(f['x'], f['y'], f['w'], f['h'])
        else
          Gosu::Image.new(@window, @main_image, true, f['x'], f['y'], f['w'], f['h'])
        end
      end

      def image_file
        File.join(@source_dir, meta['image'])
      end

      def meta
        @json['meta']
      end

      def frames
        @json['frames']
      end
    end
  end
end
