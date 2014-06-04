class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  $successmessage =  ["Login Successful", "Logged Out Succesfully", "Details Saved", "User Succesfully Created", "Password Updated","Book Issued","Book Returned","Author was successfully updated","Category was successfully updated"]
  $failuremessage = ["Incorrect Username", "Incorrect password", "Current Password Incorrect", "Passwords donot match", "Book Not Found", "Book already issued"]
end
