#The pages controller contain all of the code for any pages inside of /pages
class PagesController < ApplicationController
  before_action :authenticate_user! ,only: %i[home]
  #back end code for pages/index
  def index
  end

  #back end code for pages/home
  def home
    @posts=Post.all
    @newPost=Post.new
    @users=User.all
  end

  #back end code for pages/profile
  def profile
    # grab the username from the URL as :id
    if (User.find_by_username(params[:id]))
      @username = params[:id]
      @user = User.find_by_username(params[:id])
    else
      redirect_to root_path, :notice=> "User not found!"
    end
    @posts=Post.all.where("user_id = ?",User.find_by_username(params[:id]).id)
    @newPost=Post.new
    @users=User.all
  end

  #back end code for pages/explore
  def explore
    @posts=Post.all
    @newPost=Post.new
    @users=User.all
  end

  def search  
    @users=User.all
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else  
      @parameter = params[:search].downcase  
      @results = User.all.where("lower(username) LIKE :search", search: "%#{@parameter}%")  
      @results2 = Post.all.where("lower(content) LIKE :search", search: "%#{@parameter}%") 
    end 
  end


end