require 'opal'
require 'isomorfeus-redux'
require 'isomorfeus-react'
require 'isomorfeus-react-material-ui'
require 'isomorfeus-policy'
require 'isomorfeus-transport'
require 'isomorfeus-i18n'
require 'isomorfeus-data'
require 'isomorfeus-operation'

# require_tree 'policies'
# require_tree 'channels'
# require_tree 'data'
# require_tree 'operations'
Isomorfeus.zeitwerk.push_dir('debug_guide_components')
require_tree 'debug_guide_components', :autoload

Isomorfeus.start_app!
