class RedirectMapsController < ApplicationController

  def new
    @redirect_map = RedirectMap.new
  end
  
  def redirect
    if params[:src].present? and (maps=RedirectMap.where src: params[:src])
      req = RedirectRequest.new(request_referer: request.referer, request_agent: request.user_agent)
      req.redirect_map = maps[0]
      req.save
      redirect_to maps[0].dest
    else
      render 'pages/nothing'
    end
  end
end
