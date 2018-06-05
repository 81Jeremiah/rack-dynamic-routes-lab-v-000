class Application
  @@items =[]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    item = req.path.split("/items/").last

  # if req.path==""
    resp.finish
  end


end
