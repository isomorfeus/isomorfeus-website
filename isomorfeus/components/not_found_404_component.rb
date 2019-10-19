class NotFound404Component < LucidMaterial::Component::Base
  render do
    Isomorfeus.ssr_response_status = 404 # keep
    P "Oops, page not found!"
  end
end
