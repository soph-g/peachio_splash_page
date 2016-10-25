class Peachio < Sinatra::Base

  get '/' do
    erb :'leads/new'
  end

  post '/' do
    lead = Lead.new(email: params[:email])
    if lead.save
      erb :'./leads/index'
    else
      flash.now[:errors] = lead.errors.full_messages
      erb :'./leads/new'
    end
  end

end
