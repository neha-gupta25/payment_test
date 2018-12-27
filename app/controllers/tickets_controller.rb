class TicketsController < ApplicationController

	def index
		@tickets = Ticket.all
	end

	def new
		@ticket = Ticket.new
	end

	def create
       @ticket = Ticket.new(permitted_ticket_params)
       if @ticket.save
       	redirect_to tickets_path
       else
        render action: 'new'
       end
	end

	def show
		@ticket = Ticket.find(params[:id])
	end

    
    private
    def permitted_ticket_params
		params.require(:ticket).permit!.merge(user: current_user)
	end

end
