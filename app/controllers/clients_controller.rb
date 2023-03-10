class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :client_not_found 

    def show 
        client = Client.find(params[:id])
        render json: client, status: :ok 
    end

    private 

    def client_not_found(error) 
        render json: {error: error.message} status: 404

    end
end
