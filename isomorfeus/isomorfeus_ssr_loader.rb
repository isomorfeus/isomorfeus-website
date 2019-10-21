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

require_tree 'policies', :autoload_dirskip
require_tree 'channels', :autoload_dirskip
require_tree 'data', :autoload_dirskip
require_tree 'operations', :autoload_dirskip

# autoload shared components
require_tree 'components', :autoload_dirskip

Isomorfeus.start_app!
