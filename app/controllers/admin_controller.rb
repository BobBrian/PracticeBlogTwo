class AdminController  < ApplicationController
  before_action :authenticate_admin!

  #Get All Users
  def index
    @writers = User.where(role: 'Writer')
  end

  #Show all Users Posts
  def all_posts
    @user = User.find(params[:user_id]) # Retrieve the user
    @blog_posts = @user.blog_posts # Retrieve all posts associated with the user
  end

  #Delete Users Posts
  def destroy_post
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy

    redirect_to all_posts_path(user_id: @blog_post.user_id), notice: "Post was successfully deleted."
  end

  #Delete User
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def authenticate_admin!
    unless current_user && current_user.role == "Admin"
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end
end