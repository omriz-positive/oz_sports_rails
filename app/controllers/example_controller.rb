class ExampleController < ApplicationController
  def plain_text
    render plain: "This is a plain text and nothing more #{Time.now.to_s}"
  end

  def json_res
    res = {:title => "JSON response", :desc => "You have recieved a JSON response", :dt => Time.now }
    render json: res; # this will automatically convert to JSON with the method 'to_json'
  end

  def xml_res
    res = {:title => "XML response", :desc => "You have recieved a XML response", :dt => Time.now }
    render xml: res; # this will automatically convert to JSON with the method 'to_xml'
  end

  def view_res
    @title = "The 'View' response !!!!!!!!!!!!!!!"
    @desc = "This is a 'View' response ;D !!!!!!!!!!!!!!!"
    # rendering nothing will simply return he associated View
  end

  def all_res
    @res = {:title => "All typeof response", :desc => "You can recieve this in any way to like", :dt => Time.now }
    respond_to do |format|
      format.html # all_res.html.erb
      format.xml  { render :xml => @res}
      format.json { render :json => @res}
    end
  end
end
