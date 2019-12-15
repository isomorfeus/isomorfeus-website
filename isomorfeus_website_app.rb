require_relative 'app_loader'
require_relative 'owl_init'
require_relative 'iodine_config'

# Isomorfeus.server_side_rendering = false

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
      <!DOCTYPE html>
      <html>
        <head>
          <title>The Isomorfeus Project</title>
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <link rel="icon" href="/favicon.png" type="image/png">
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

    r.get 'robots.txt' do
      r.public
    end

    r.get 'debug_guide' do
      <<~HTML
        <!DOCTYPE html>
        <html>
          <head>
            <title>The Isomorfeus Project</title>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="icon" href="/favicon.png" type="image/png">
            <style id="jss-server-side" type="text/css">#{ssr_styles}</style>
            #{owl_script_tag 'application_debug_guide.js'}
          </head>
          <body>
            <div data-iso-env="production" data-iso-root="IsomorfeusDebugGuideApp" data-iso-props="{}"></div>
          </body>
        </html>
      HTML
    end

    r.get do
      content = page_content(env, env['PATH_INFO'])
      response.status = ssr_response_status
      content
    end
  end
end
