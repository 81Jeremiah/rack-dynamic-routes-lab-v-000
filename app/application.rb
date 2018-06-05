require 'pry'
class Application
  @@items =[]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
  if req.path.match(/items/)
    item = req.path.split("/items/").last
      if @@items.collect{|item_from_cart|item_from_cart.name}.include?(item)
        binding.pry
        found_item = @@items.find{|item|item.name == item}
        resp.write found_item.price
      end
  else
    resp.write "Route not found"
    resp.status = 404
  end
  # if req.path==""
    resp.finish
  end


end
