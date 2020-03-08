require_relative 'app_loader'

if ENV['RACK_ENV'] && ENV['RACK_ENV'] != 'development'
  Isomorfeus.zeitwerk.setup
  Isomorfeus.zeitwerk.eager_load

  run IsomorfeusWebsiteApp.app
else
  Isomorfeus.zeitwerk.enable_reloading
  Isomorfeus.zeitwerk.setup
  Isomorfeus.zeitwerk.eager_load

  run ->(env) do
    write_lock = Isomorfeus.zeitwerk_lock.try_write_lock
    if write_lock
      Isomorfeus.zeitwerk.reload
      Isomorfeus.zeitwerk_lock.release_write_lock
    end
    Isomorfeus.zeitwerk_lock.with_read_lock do
      IsomorfeusWebsiteApp.call env
    end
  end
end
