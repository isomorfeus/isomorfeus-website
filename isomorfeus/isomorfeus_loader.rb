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

require_tree 'policies'
require_tree 'channels', :autoload_dirskip
require_tree 'data', :autoload_dirskip
require_tree 'operations', :autoload_dirskip

# autoload shared components
require_tree 'components/shared', :autoload_dirskip

# require top level components directly
require 'components/shared/app_bar'
require 'components/logo'
require 'components/not_found_404_component'
require 'components/navigation_links'

# docs
require 'components/guides'
require 'components/api_docs'
require 'components/interactive_docs'

# commercial
require 'components/consulting'
require 'components/professional'
require 'components/enterprise'

# first page
require 'components/welcome_component'

require 'components/isomorfeus_website_app'

Isomorfeus.start_app!
