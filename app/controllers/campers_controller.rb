class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers, except:[:created_at, :updated_at]
    end

    def show
        camper = Camper.find_by(id: params[:id])
        render json: camper, except:[:created_at, :updated_at], include: :activities
    end

end
