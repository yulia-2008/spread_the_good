class Api::V1::ConnectionsController < ApplicationController
    #skip_before_action :authorized, only: [:create,  :index, :show, :update]

        def index
          @connections = Connection.all 
          render json: @connections
        end

        def show 
          @connection = Connection.find_by(id:params[:id])
          render json: @connection, include: [:help_seeker, :helper]
        end

        def create
          @connection = Connection.create(c_params)
            render json: { connection: ConnectionSerializer.new(@connection), jwt: @token }, status: :created
        end

        def destroy 
          @connection = Connection.find_by(id:params[:id])
          @connection.destroy
        end
       
        private
       
        def c_params
          params.require(:connection).permit(:help_seeker_id, :helper_id)
        end
end
