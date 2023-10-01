class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        posts_path
    end
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone, :country, :date_of_birth, :gender, :avatar])
    end

    def show
        @post = Post.find(params[:id])
        # Fetch any associated comments if needed
        @comments = @post.comments
    end
end