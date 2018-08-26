module ApplicationHelper

  def full_title(page_title = '')
    base_title = 'Gazogoi - 画像で語彙を覚える'
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
end
