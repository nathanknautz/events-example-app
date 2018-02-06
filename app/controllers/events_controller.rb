class EventsController < ApplicationController
  def index
    keyword = params[:keyword]
    city = params[:city]
    @events = Unirest.get("https://app.ticketmaster.com/discovery/v2/events.json?city=#{city}&keyword=#{keyword}&apikey=#{ENV['API_KEY']}").body
    render json: @events
  end
end
