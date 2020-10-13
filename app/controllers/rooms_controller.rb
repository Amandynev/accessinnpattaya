class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @rooms = Room.all
  end
end
