module ApplicationHelper
  def admin_signed_in?
    if user_signed_in? && (current_user.role == 'admin' || current_user.role == 'owner')
      return true
    end
  end
end
