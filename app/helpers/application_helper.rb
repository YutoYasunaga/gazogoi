module ApplicationHelper

  def full_title(page_title = '')
    base_title = 'Tiếng Nhật Bằng Hình Ảnh'
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def admin_signed_in?
    if user_signed_in? && (current_user.role == 'admin' || current_user.role == 'owner')
      return true
    end
  end

  def lazy_image_tag(source, options={})
    options['data-src'] = asset_path(source)
    if options[:class].blank?
      options[:class] = 'lazyestload'
    else
      options[:class] = "lazyestload #{options[:class]}"
    end
    image_tag('lazyload.gif', options)
  end
end
