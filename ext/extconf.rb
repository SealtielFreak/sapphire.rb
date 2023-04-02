require 'mkmf'
require_relative 'auxlib.rb'


$CLIBS = {}
$MODE_COMPILE = :generic

$INCFLAGS << " -Iinclude/"

$CLIBS[:generic] = %w[
  csfml-graphics
  csfml-window
  csfml-system
  csfml-audio
]

if System.windows?
  run_script 'msys2.sh'
else
  run_script 'linux.sh'
end

$CLIBS[$MODE_COMPILE].each { |l| have_library(l) }

create_makefile 'ext', 'src'