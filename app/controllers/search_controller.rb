class SearchController < ApplicationController

  def index
    state = params[:state]
    @conn = Faraday.new(url:  "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-Key"] = "S9JON3ruNOI6XiyymcnZ7gtsjnToPxuXyT0bgeaX" #what is going on with each of these steps
      faraday.adapter Faraday.default_adapter                                   #where do I put the ENV var from figaro?
    end

    response = @conn.get("/congress/v1/members/house/#{state}/current.json")

    results = JSON.parse(response.body, symbolize_names: true)[:results]
    @members  = results.map do |result|
      Member.new(result)
    end
    require 'pry'; binding.pry
  end

end
