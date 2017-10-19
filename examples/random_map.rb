ROOT_DIR = File.dirname(File.dirname(__FILE__))

# Add ../lib to load path
$:.unshift File.join(ROOT_DIR, 'lib')

require 'gosu'
require 'gosu_texture_packer'

class GameWindow < Gosu::Window
  WIDTH = 800
  HEIGHT = 600
  TILE_SIZE = 128
  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = 'Click space to toggle random redraws'
    json_path = File.join(ROOT_DIR, 'spec', 'files', 'ground.json')
    @tileset = Gosu::TexturePacker.load_json(json_path, :precise)
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
    @redraw = !@redraw if id == Gosu::KbSpace
  end

  def needs_redraw?
    if @redraw.nil?
      @redraw = false
      true
    else
      @redraw
    end
  end

  def draw
    (0..WIDTH / TILE_SIZE ).each do |x|
      (0..HEIGHT / TILE_SIZE ).each do |y|
        xx = x * (TILE_SIZE)
        yy = y * (TILE_SIZE)
        text = "#{xx}:#{yy}"
        @tileset.frame(@tileset.frame_list.sample).draw(xx, yy, 0)
        Gosu::Image.from_text(self, text, Gosu.default_font_name, 20).draw(xx, yy, 1)
      end
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
