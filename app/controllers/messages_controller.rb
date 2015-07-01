class MessagesController < ApplicationController
      before_action :require_user, only: [:index, :new, :create]

      before_action :require_admin, only: [:destroy]
      def index 
      	  @message = Message.all
      end

      def new 
      	  @message = Message.new
      end

      def create
      	  @message = Message.new(message_params)
	  if @message.save
	     redirect_to '/messages'
	  else 
	     render 'new'
	  end
      end

      def destroy
      	  @message = Message.find(params[:id])
	  @message.destroy
	  redirect_to root_url
      end

      private 
      	def message_params
	    params.require(:message).permit(:content)
	end
	      	  

end
