module RathaHelpers
  def locale
  	req.params['locale'].eql?('zh') ? 'zh' : 'en'
  end
end