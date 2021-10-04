class HomeController < ApplicationController
  def index
    @my_name = "Inochi Ze'evi";
    @my_age = 26;
    # Will return the accosiated View 
  end
  def hello_world
    render plain: "Hello World (in a plain text)"
  end
  def json_res
    hash = {};
    hash[:success] = true;
    hash[:desc] = "You got this response in a JSON format";
    hash[:result] = "hello world";
    hash[:date] = Time.now;
    render json: hash;
  end
end
