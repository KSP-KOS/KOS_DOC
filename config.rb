#------------------------------------------------------------------------
# Configuration
#------------------------------------------------------------------------

# LiveReload and pretty URLs
activate :livereload
activate :directory_indexes

# Use relative paths
activate :relative_assets
set :relative_links, true

# Asset paths
set :css_dir,    'stylesheets'
set :js_dir,     'javascripts'
set :images_dir, 'images'

set :haml, { ugly: true }
set :markdown, layout_engine: :haml
set :md, layout_engine: :haml

page "*", :layout => "main"

configure :build do
  activate :minify_css
  activate :minify_javascript
end
