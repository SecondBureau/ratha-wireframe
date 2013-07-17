module RathaHelpers
  #def locale
  #	req.params['locale'].eql?('zh') ? 'zh' : 'en'
  #end
  def parse_nav(nav)
    unless (matches = /([_a-z0-9]+)\[([a-z]+)\]/.match(nav)).nil?
      return [matches[1],matches[2]] 
    end
   nav
 end
 
  def preview_image_tag
    image_file = File.join(root, 'source', 'images', 'mockups', "#{current_page.data.preview}.png")
    puts image_file
    layout_preview = File.exists?(image_file) ? current_page.data.preview : 'default'
    image_tag "mockups/#{layout_preview}.png", :class => 'img-polaroid'
  end
end