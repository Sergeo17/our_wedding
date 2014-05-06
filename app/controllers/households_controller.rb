class HouseholdsController < ApplicationController

  def index
  end

  def show
    @household = Household.find(params[:id])
  end

  def new
    @household = Household.new
    @household.guests.build
  end

  def create
    @household = Household.new(household_params)
    if @household.save
      redirect_to @household
    else
      render 'new'
    end
  end

  def edit
    @household = Household.find(params[:id])
  end

  def update
    @household = Household.find(params[:id])
    if @household.update_attributes(household_params)
      redirect_to @household
    else
      render 'edit'
    end
  end


  def search
    @households = Household.search(params[:search],params[:zipcode])
    if params[:search].blank?
      render 'search'
      return
    end
    if @households.uniq{|x| x.id}.count == 1
      redirect_to :controller => 'households', :action => 'edit', :id => @households.first.id
    elsif
      @households.nil?
      render 'search'
    else
      @households = @households.uniq{|x| x.id}
      render 'select'
    end
  end


  private

  def household_params

    params.require(:household).permit(:addressline1, :addressline2, :city, :state, :zipcode,
                                      :guests_attributes => [:id, :firstname, :lastname, :household_id,
                                                             :welcome_party, :wedding, :breakfast,
                                                             :shuttle, :email, :vegetarian, :is_plus_one,
                                                             :plus_one_declined, :rsvp_date, :_destroy],
                                      :comments_attributes => [:comment, :household_id])

  end

end

