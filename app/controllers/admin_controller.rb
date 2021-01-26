class AdminController < ApplicationController
    layout false 
    before_action :admin?

    def users_count
        @users_count = User.count 
    end
end