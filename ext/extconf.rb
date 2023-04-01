require 'mkmf'
require_relative 'auxlib.rb'

LIBS = {}
MODE_COMPILE = if Arguments.include? 'static' and System.window? then :static_window else :generic end 

$INCFLAGS << " -Iinclude/"

LIBS[:static_window] = %w[
  SDL2
  SDL2_ttf
  SDL2_gfx
  SDL2_mixer
  SDL2_image
]

LIBS[:generic] = %w[
  SDL2
  SDL2_ttf
  SDL2_gfx
  SDL2_mixer
  SDL2_image
]

if System.windows?
  run_script 'msys2.sh'
else
  run_script 'linux.sh'
end

case MODE_COMPILE
when :static_window
  %w[

  ].each { |f| append_cppflags f }

  %w[

  ].each { |f| append_cppflags f }
when :generic
  # something
end

LIBS[MODE_COMPILE].each { |l| abort unless have_library(l) }

create_makefile 'ext', 'src'