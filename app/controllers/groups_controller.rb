class GroupsController < ApplicationController
    def view
    @user = User.find_by(id: params[:id])
    @group = Group.new
    @group.users << @current_user
    end

    def create 
        @group = Group.new(
            name: params[:name]
        )
        @group.save

    end

 

end
