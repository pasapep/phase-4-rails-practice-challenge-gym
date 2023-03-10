class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :private_methods_name

    def show 
        gym = Gym.find(params[:id])
        render json: gym, status: :ok 
    end

    def destroy 
        gym = Gym.find(params[:id])
        gym.destroy 

        head :no_content, status: :no_content 
    end

    private 

    # def private_methods_name (error)
    #     render json: {error:error.message}, status: 404

    # end

    def private_methods_name 
        render json: {error:"Gym not found"}, status: 404

    end
end
