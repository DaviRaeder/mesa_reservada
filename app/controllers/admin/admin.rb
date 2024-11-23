module Admin
  before_action :check_admin!

  def check_admin!
    unless current_user.admin?
      redirect_to root_path, alert: 'Acesso restrito!'
    end
  end
end
