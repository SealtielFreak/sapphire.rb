require 'mkmf'
require_relative 'auxlib.rb'

CHECK_PACKAGE = Arguments.include? 'install-package'
LIBS = {}
MODE_COMPILE = if Arguments.include? 'static' and System.window? then :static_window else :generic end 

$INCFLAGS << " -Iinclude/"

puts $TARGET

LIBS[:static_window] = %w[
  SDL2
]

LIBS[:generic] = %w[
  SDL2
]

if CHECK_PACKAGE
  puts 'Installing dependencies...'

  if System.windows?
    run_script 'msys2.sh'
  else
    run_script 'linux.sh'
  end
end

case MODE_COMPILE
when :static_window
  %w[
    -DCSFML_STATIC
  ].each { |f| append_cppflags f }

  %w[
    -static
  ].each { |f| append_cppflags f }
when :generic
  # something
end

LIBS[MODE_COMPILE].each { |l| have_library(l) }

create_makefile 'ext'