require_relative 'app_loader'
require_relative 'owl_init'
require_relative 'iodine_config'


class IsomorfeusWebsiteApp < Roda
  extend Isomorfeus::Transport::Middlewares
  include OpalWebpackLoader::ViewHelper
  include Isomorfeus::ReactViewHelper

  use_isomorfeus_middlewares
  plugin :public, root: 'public'

  def page_content(location)
    <<~HTML
      <html>
        <head>
          <title>Isomorfeus Framework</title>
          #{owl_script_tag 'application.js'}
        </head>
        <body>
          #{mount_component('IsomorfeusWebsiteApp', location: location)}
        </body>
      </html>
    HTML
  end

  route do |r|
    r.root do
      page_content('/')
    end

    r.public

    r.get 'favicon.ico' do
      r.public
    end

    r.get do
      page_content(env['PATH_INFO'])
    end
  end
end
