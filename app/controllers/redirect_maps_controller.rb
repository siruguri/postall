class RedirectMapsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def new
    @redirect_map = RedirectMap.new
  end

  def index
    @redirect_maps = RedirectMap.all
  end
  
  def create
    @redirect_map = RedirectMap.new(params[:redirect_map].permit(:src, :dest))

    if @redirect_map.valid?
      @redirect_map.save
      redirect_to redirect_map_path(@redirect_map)
    else
      flash[:alert] = @redirect_map.errors.full_messages.join("\n")
      render 'new'
    end
  end
  
  def redirect
    if params[:src].present? and !(maps=RedirectMap.where(src: params[:src])).empty?
      req = RedirectRequest.new(request_referer: request.referer, request_agent: request.user_agent)
      req.redirect_map = maps[0]
      req.save
      redirect_to maps[0].dest
    else
      render 'pages/nothing'
    end
  end
end
