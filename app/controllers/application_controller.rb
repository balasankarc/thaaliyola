#encoding: utf-8
class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    before_filter :set_locale_of_user
    $successmessage =  ["Login Successful", "Logged Out Succesfully", "Details Saved", "User Succesfully Created", "Password Updated","Book Issued","Book Returned","Author was successfully updated","Category was successfully updated"]
    $failuremessage = ["Incorrect Username", "Incorrect password", "Current Password Incorrect", "Passwords donot match", "Book Not Found", "Book already issued"]
    def set_locale_of_user()
        if session[:user]
            I18n.locale = User.where("username = ?",session[:user].to_s).first.locale
        else
            I18n.locale = "en"
        end
    end

    def current_user()
        if session[:user]
            return  User.where("username = ?",session[:user].to_s).first
        else
            return nil
        end
    end
    def isadmin()
        if session[:user]
            if User.where("username = ?",session[:user].to_s).first.admin.to_s == 'true'
                return true
            else
                return false
            end
        else
            return nil
        end
    end
end
