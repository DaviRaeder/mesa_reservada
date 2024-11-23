module Admin
  extend ActiveSupport::Concern

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: 'Você não tem permissão para acessar esta página.'
    end
  end
end
