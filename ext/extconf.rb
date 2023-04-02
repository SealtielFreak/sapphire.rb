require 'mkmf'
require_relative 'auxlib.rb'

$INCFLAGS << " -Iinclude/"

if System.windows?
  run_script 'msys2.sh'
else
  run_script 'linux.sh'
end

%w[
  SDL2
  SDL2_ttf
  SDL2_gfx
  SDL2_mixer
  SDL2_image
].each { |l| abort unless have_library(l) }

create_makefile 'ext', 'src'