class OrganizationsController < ApplicationController

    def create
        @organization = Organization.new(name: organization_params[:name], org_type: organization_params[:org_type], accepts_donations: organization_params[:accepts_donations], location: organization_params[:location])
        if @organization.save
            Administrator.create(user_id: current_user.id, organization_id: organization_params[:id])
            flash[:notice] = "Your organization was created!"
            redirect_to @organization
        else
            flash[:alert] = @organization.errors.full_messages.join(", ")
            render 'new'
        end
    end

    def new
    end

    def show
        @organization = Organization.find(params[:id])
    end

    def organization_params
        if params[:organization]
            params[:organization]
        else
            params
        end
    end
end
