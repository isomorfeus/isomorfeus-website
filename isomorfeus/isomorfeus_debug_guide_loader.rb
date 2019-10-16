require 'opal'
require 'opal-autoloader'
require 'isomorfeus-redux'
require 'isomorfeus-react'
require 'isomorfeus-react-material-ui'
require 'isomorfeus-policy'
require 'isomorfeus-transport'
require 'isomorfeus-i18n'
require 'isomorfeus-data'
require 'isomorfeus-operation'

Opal::Autoloader.add_load_path('debug_guide_components')

# require_tree 'policies'
# require_tree 'channels'
# require_tree 'data'
# require_tree 'operations'
require_tree 'debug_guide_components', :autoload_dirskip

Isomorfeus.start_app!
