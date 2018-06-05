class Application
  @@items =[]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
  if req.path.match(/items/)
    item = req.path.split("/items/").last

  else
    resp.write "Route not found"
    resp.status = 404
  end
  # if req.path==""
    resp.finish
  end


end
