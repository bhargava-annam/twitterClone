class PostsController < ApplicationController

    before_action :authenticate_user! 
    
    respond_to :js, :json, :html

    def new
        @post =Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        respond_to do |format|
            if (@post.save)
                format.html { redirect_to "", notice: "Post was successfully created." }
            else
                format.html { redirect_to "", notice: "Error." }
            end
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
     
        respond_to do |format|
          format.html { redirect_to "" }
          format.json { head :no_content }
       end
    end
    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
       if @post.user_id == current_user.id
        @post.update (post_params)
        redirect_to root_path ,notice:"Succesfully edited the tweet."
       else
        redirect_to root_path ,notice:"NOT AUTHERISED"
       end
    end

    def like
        @post = Post.find(params[:id])
        if !current_user.liked? @post
            @post.liked_by current_user
        elsif current_user.liked? @post
            @post.unliked_by current_user
        end
        # redirect_back(fallback_location: root_path)
        
    end

    private

    # Only allow a list of trusted parameters through.
    def post_params
        params.require(:post).permit(:user_id,:content, :image, :remove_image)
    end

end
