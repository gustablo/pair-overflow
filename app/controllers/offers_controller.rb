class OffersController < ApplicationController
    before_action :set_post

    def create
        @post.offer.create! params.required(:offer).permit(:content, :user_id).merge(user_id: Current.user.id)
        redirect_to @post
    end

    private
        def set_post
            @post = Post.find(params[:post_id])
        end
 
end
