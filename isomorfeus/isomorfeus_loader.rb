require 'opal'
require 'opal-autoloader'
require 'isomorfeus-redux'
require 'isomorfeus-react'
require 'isomorfeus-react-material-ui'
require 'isomorfeus-transport'
require 'isomorfeus-data'
require 'isomorfeus-i18n'
require 'isomorfeus-operation'

require_tree 'components'
require_tree 'data'
require_tree 'operations'

Isomorfeus.start_app!
