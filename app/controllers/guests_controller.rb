class GuestsController < ApplicationController
  def new
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def index
    @guests = Guest.admin_search(params[:search])
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes!(guest_params)
      redirect_to @guest
    else
      render 'edit'
    end
  end




  def search
    @guests = Guest.search(params[:search])
  end

  def summary
    @guests = Guest.all
  end

  private

  def guest_params
    params.require(:guest).permit(:firstname, :lastname, :household_id,
                                  :welcome_party, :wedding, :breakfast,
                                  :shuttle, :email, :vegetarian, :is_plus_one,
                                  :plus_one_declined, :response_date)
  end

end
