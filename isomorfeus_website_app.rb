require_relative 'app_loader'
require_relative 'owl_init'
require_relative 'iodine_config'

class IsomorfeusWebsiteApp < Roda
  extend Isomorfeus::Transport::Middlewares
  include OpalWebpackLoader::ViewHelper
  include Isomorfeus::ReactViewHelper

  use_isomorfeus_middlewares
  plugin :public, root: 'public'

  def page_content(env, location)
    locale = env.http_accept_language.preferred_language_from(Isomorfeus.available_locales)
    locale = env.http_accept_language.compatible_language_from(Isomorfeus.available_locales) unless locale
    locale = Isomorfeus.locale unless locale
    rendered_tree = mount_component('IsomorfeusWebsiteApp', location_host: env['HTTP_HOST'], location: location, locale: locale)
    <<~HTML
      <html>
        <head>
          <title>Isomorfeus Framework</title>
          <style id="jss-server-side" type="text/css">#{ssr_styles}</style>
          #{owl_script_tag 'application.js'}
        </head>
        <body>
          #{rendered_tree}
        </body>
      </html>
    HTML
  end

  route do |r|
    r.root do
      page_content(env, '/')
    end

    r.public

    r.get 'favicon.ico' do
      r.public
    end

    r.get do
      content = page_content(env, env['PATH_INFO'])
      response.status = ssr_response_status
      content
    end
  end
end
