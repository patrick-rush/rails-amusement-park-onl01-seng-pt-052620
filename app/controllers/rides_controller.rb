class RidesController < ApplicationController

    def create
        # binding.pry
        ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction_id])
        if ride
            ride.save
            # ride.take_ride
            flash[:notice] = ride.take_ride
            # binding.pry
            redirect_to user_path(ride.user_id)
        end
    end

    private

    params.require(:ride).permit(:user_id, :attraction_id)

end
