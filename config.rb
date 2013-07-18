###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
 activate :automatic_image_sizes

# Reload the browser automatically whenever files change
 activate :livereload
 
# Enable i18n
 activate :i18n, :path => "/:locale/", :templates_dir => "localizable", :langs => [:en, :zh], :mount_at_root => false


# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

%w[en zh].each do |lang|

  %w[senova es yusheng b40 weiwang].each do |m|
    proxy "/#{lang}/pages/vehicles_#{m}.html",  "/localizable/pages/vehicles_model.html",:locals => { :vehicle_model => m }, :ignore => true do
      ::I18n.locale   = lang
      @lang           = lang 
    end
  end
  
  %w[customers finances tuning].each do |s|
    proxy "/#{lang}/pages/services_#{s}.html",  "/localizable/pages/services_service.html", :locals => { :service_name => s }, :ignore => true do
      ::I18n.locale   = lang
      @lang           = lang
    end
  end
  
  %w[dealer1 dealer2].each do |s|
    proxy "/#{lang}/pages/dealers_#{s}.html", "/localizable/pages/dealers_dealer.html", :locals => { :dealer_name => s }, :ignore => true do
      ::I18n.locale   = lang
      @lang           = lang
    end
  end

  %w[senova energy].each do |s|
    proxy "/#{lang}/pages/technologies_#{s}.html", "/localizable/pages/technologies_technology.html", :locals => { :technology_name => s }, :ignore => true do
       ::I18n.locale   = lang
        @lang           = lang
    end
  end
  
  %w[history orgchart recruitment].each do |s|
    proxy "/#{lang}/pages/aboutus_#{s}.html", "/localizable/pages/aboutus.html", :locals => { :aboutus_name => s }, :ignore => false do
       ::I18n.locale   = lang
        @lang           = lang
    end
  end

end

# Build-specific configuration
configure :build do

  ignore 'images/*.psd'
  ignore 'stylesheets/lib/*'
  ignore 'stylesheets/vendor/*'
  ignore 'javascripts/lib/*'
  ignore 'javascripts/vendor/*'

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets
  
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end

require "lib/ratha_helpers"
helpers RathaHelpers