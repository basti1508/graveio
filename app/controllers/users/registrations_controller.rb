class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
    unless current_user.nil?
      current_user.add_new_api_key
    end
  end

  def posts
    @posts = Post.find_all_by_author(User.find_by_id(params[:user_id]).email)
    @user = User.find_by_id(params[:user_id])
    respond_to do |format|
      format.html { render :posts }
    end
  end

end
