class AlertsController < ApplicationController

  # display in account page
  def index
    @alerts = Alert.all
  end

  # new alert button in on country show page
  def create
    @alert = Alert.new
    @country = Country.find(params[:country_id])
    @alert.country = @country
    @alert.user = current_user

    if @alert.save?
      redirect_to country_path(@country)
    else
      render "countries/show"
    end
  end

  def destroy
    @alert = Alert.find(:id)
    @alert.destroy

    redirect_to alerts_path
  end

  private

  # def alert_params
  #   params.require(:alert).permit()
  # end

end
