class PostsController < ApplicationController
    
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

    private

    # Only allow a list of trusted parameters through.
    def post_params
        params.require(:post).permit(:user_id,:content)
    end

end
