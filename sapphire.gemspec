require_relative 'lib/sapphire/version'

Gem::Specification.new do |s|
    s.name        = 'sapphire'
    s.version     = Sapphire::VERSION
    s.summary     = 'Experimental game framework for Ruby'
    s.description = 'Sapphire is a framework for game develop, power by SDL'
    s.homepage    = 'https://github.com/sealtielfreak/sapphire.rb/'
    
    s.authors     = ['Sealtiel Valderrama']
    s.email       = 'SealtielFreak@yandex.com'
    s.license     = 'LGPL-2.1'

    s.required_ruby_version = '>= 3.0.6'
    s.add_development_dependency 'rake', '~> 11.2', '>= 11.2.2'

    s.files       = Dir.glob('ext/**/*.{rb,sh}') +
                    Dir.glob('ext/include/**/*.{h}') +
                    Dir.glob('ext/src/*.{c}') +

                    Dir.glob('lib/**/*.{rb}') +
                    Dir.glob('bin/**/*.{rb}') +
                    Dir.glob('test/**/*.{rb,png,otf}') +

                    Dir.glob('assets/**/*.{otf}')

    s.extensions  = ['ext/extconf.rb']
end
