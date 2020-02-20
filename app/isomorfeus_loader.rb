require 'opal'
require 'isomorfeus-redux'
require 'isomorfeus-react'
require 'isomorfeus-react-material-ui'
require 'isomorfeus-policy'
require 'isomorfeus-transport'
require 'isomorfeus-i18n'
require 'lucid_prop_declaration/mixin'
require 'isomorfeus-data'
require 'isomorfeus-operation'

require_tree 'policies', :autoload
require_tree 'channels', :autoload
require_tree 'data', :autoload
require_tree 'operations', :autoload
require_tree 'components', :autoload

Isomorfeus.start_app!
