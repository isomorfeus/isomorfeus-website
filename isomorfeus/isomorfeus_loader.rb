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

require_tree 'policies'
require_tree 'channels'
require_tree 'data'
require_tree 'operations'

# autoload shared components
require_tree 'components/shared', :autoload

# require top level components directly
require 'components/logo'
require 'components/not_found_404_component'
require 'components/navigation_links'

# commercial
require 'components/consulting/main'
require 'components/professional/main'
require 'components/enterprise/main'

# public
require 'components/api_docs/main'
require 'components/guides/main'
require 'components/interactive_docs/main'

# first page
require 'components/welcome_component'

require 'components/isomorfeus_website_app'

Isomorfeus.start_app!
