class BusinessCardsController < ApplicationController
	before_action :set_card, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	def index
		@cards = BusinessCard.all.reverse
		@card = BusinessCard.new	
	end

	def new
		@card = BusinessCard.new

		respond_to do |format|
			format.html
			format.js  
		end
	end

	def edit
	end

	def show
	end

	def create
		@card = BusinessCard.new(card_params)
		if @card.save
			# respond_to do |format|
			# 	format.html {redirect_to business_card_path(@card), notice: "New card created!"}
			# 	format.js 
			# end
			redirect_to @card, notice: "Your business card has been saved successfully."
		else
			render :new
		end
	end

	def update
		if @card.update(card_params)
			redirect_to @card, notice: "Updated successfully"
		else
			render :edit
		end
	end

	def destroy
		@card.destroy
		redirect_to business_cards_path, notice: "Your business card was deleted successfully."
	end

	private

	def card_params
		params.require(:business_card).permit(:company_name, :web_url, :full_name, :job_title, :phone, :email, :avatar).merge(user: current_user)
	end

	def set_card
		begin
			@card = BusinessCard.find(params[:id])
		rescue
			flash[:notice] = "That business card is not available."
			redirect_to business_cards_path
		end
	end

end

