module RathaHelpers
  
  def parse_nav(nav)
    unless (matches = /([_a-z0-9]+)\[([a-z]+)\]/.match(nav)).nil?
      return [matches[1],matches[2]] 
    end
    nav
  end
 
  def link_to_mockup_image
    image_file = File.join(root, 'source', 'images', 'mockups', "#{current_page.data.mockup}.png")
    mockup = File.exists?(image_file) ? current_page.data.mockup : 'default'
    link_to image_tag("mockups/#{mockup}.png"), "/images/mockups/#{mockup}.png", :title => mockup.humanize, :"data-description" => '...', :class => 'thumbnail'
  end
end