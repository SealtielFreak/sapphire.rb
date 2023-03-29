require_relative 'sapphire/ext'

def random_color(n = 255)
  Array.new(3) { rand n }
end
