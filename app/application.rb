require 'pry'
class Application
  @@items =[]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
  if req.path.match(/items/)
    item = req.path.split("/items/").last
    item_from_cart = @@items.find{|i|i.name == item}

        binding.pry
        resp.write item_from_cart.price
      #end
  else
    resp.write "Route not found"
    resp.status = 404
  end
  # if req.path==""
    resp.finish
  end


end
