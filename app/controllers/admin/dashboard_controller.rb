class Admin::DashboardController < AdminController
  def home
    @preview = @website.first_page
  end
end
