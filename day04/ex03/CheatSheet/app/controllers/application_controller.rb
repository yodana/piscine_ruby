# ApplicationController est le contrôleur de base pour toute l'application.
# 
# Il configure les politiques de navigateurs modernes et la gestion du cache
# via les importmaps.

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end
