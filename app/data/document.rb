class Document < LucidData::Document::Base
  BASE_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..'))
  TWO_PATHS = %w[isomorfeus-project isomorfeus-react isomorfeus-redux opal-webpack-loader arango-driver opal-zeitwerk]
  MODULE_PATHS = %w[isomorfeus isomorfeus-data isomorfeus-i18n isomorfeus-mailer isomorfeus-operation isomorfeus-policy isomorfeus-transport]
  HAS_RUBY_DIR = %w[isomorfeus-project isomorfeus-react isomorfeus-redux isomorfeus-react isomorfeus-redux]

  attribute :markdown

  execute_load do |key:|
    path_parts = key.split('/')

    mod = nil

    if path_parts.size == 2
      repo = path_parts[0]
      doc = path_parts[1]
    elsif path_parts.size == 3
      repo = path_parts[0]
      mod = path_parts[1]
      doc = path_parts[2]
    else
      raise 'invalid key'
    end

    raise 'invalid doc name' if doc.include?('.')

    doc_path = if doc == 'README'
                 doc
               else
                 "docs/#{doc}"
               end
    doc_path = doc_path + '.md'

    if mod
      repo_dir = 'isomorfeus-project'
      mod_path = MODULE_PATHS.detect { |path| path.include?(mod) }
    else
      repo_dir = TWO_PATHS.detect { |path| path.include?(repo) }
    end

    repo_dir = "#{repo_dir}/ruby" if HAS_RUBY_DIR.include?(repo_dir)

    filename = if mod
                 File.join(BASE_PATH, repo_dir, mod_path, doc_path)
               else
                 File.join(BASE_PATH, repo_dir, doc_path)
               end

    raise "no such document #{filename}" unless File.exist?(filename)

    self.new(key: key, attributes: { markdown: File.read(filename) })
  end
end
