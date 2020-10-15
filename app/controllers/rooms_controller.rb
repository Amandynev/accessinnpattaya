class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @rooms = Category.all
  end

  def show
  end
end
