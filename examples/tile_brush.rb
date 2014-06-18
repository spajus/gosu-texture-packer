ROOT_DIR = File.dirname(File.dirname(__FILE__))

# Add ../lib to load path
$:.unshift File.join(ROOT_DIR, 'lib')

require 'gosu'
require 'gosu_texture_packer'

class GameWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = 'Click screen with mouse to draw textures'
    @tileset = Gosu::TexturePacker.load_json(
      self, File.join(ROOT_DIR, 'spec', 'files', '_UI.json'))
    @drawing = {}
  end

  def needs_cursor?
    true
  end

  def update
    @fps = Gosu::Image.from_text(
      self, "FPS: #{Gosu.fps}; Mem Usage: #{memory_usage}",
      Gosu.default_font_name, 30)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
    if id == Gosu::MsLeft
      @drawing[[mouse_x, mouse_y]] = @tileset.frame(@tileset.frame_list.sample)
    end
  end

  def draw
    @drawing.each do |coords, tile|
      tile.draw(coords[0], coords[1], 0)
    end
    @fps.draw(10, 10, 1)
  end

  private

  def memory_usage
    `ps -o rss= -p #{Process.pid}`
      .chomp.gsub(/(\d)(?=(\d{3})+(\..*)?$)/,'\1,') + ' KB'
  rescue
    "Unavailable. Using Windows?"
  end
end

GameWindow.new.show
