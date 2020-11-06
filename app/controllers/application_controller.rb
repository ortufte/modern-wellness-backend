class ApplicationController < ActionController::API
    include ::ActionController::Cookies

        def current_user
            user = User.find_by(id: session[:user_id])
            render json: UserSerializer.new(user)
        end

        def logged_in?
            if current_user
                return true
            else
                return false
            end
            
        end

end
