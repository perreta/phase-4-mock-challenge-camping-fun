class ActivitiesController < ApplicationController

    def index
        activities = Activity.all
        render json: activities
    end

    def show
        activity = Activity.find_by(id: params[:id])
        render json: activity, except:[:created_at, :updated_at], include: :campers
    end

    def destroy
        activity = Activity.find_by(id: params[:id])
        if activity
            activity.destroy
            head :no_content
        else
            render json: { error: "Activity not found" }, status: :not_found
        end
    end

end
