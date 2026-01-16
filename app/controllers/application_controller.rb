class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  helper_method :authenticated?, :current_user, :admin?

  def current_user
    Current.user
  end

  def admin?
    authenticated? && Current.user&.isAdmin
  end

  def require_admin!
    unless admin?
      redirect_to root_path, alert: "Acesso restrito"
    end
  end
end
