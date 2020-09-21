class PassengerFlightsController <ApplicationController
  def destroy
    PassengerFlight.destroy(params[:id])

    redirect_to '/flights'
  end
end
