class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
    end

    def logged_in?
    end

    def log_in_user!(user)

    end
    
end


# C - current_user - returns nil or an instance of the user class representing the user whose db session_token matches the current session token stored in the session cookie
# E - ensure_logged_in - checks if the current_user method returns nil, and if so, redirects the user to the login page
# L - logged_in? - checks if there is a current user logged in
# L - logout! - logs a user out; sets the session_token within the session cookie to nil, resets the current_users session token, and sets @current_user to nil
# L - login! - sets the session_token in the session cookie to the result of calling reset_session_token on the given user
