class GroupsController < ApplicationController
    def view
    @user = User.find_by(id: params[:id])
    @group = Group.new
    @group.users << @current_user
    end

    def create 
        @group = Group.new(group_params)
        if @group.save
            redirect_to root_path
          else
            render :new
          end
    end

    private
    def group_params
      params.require(:groups).permit(:name)
    end


end
