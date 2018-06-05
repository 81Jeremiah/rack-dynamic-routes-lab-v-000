require 'pry'
class Application
  @@items =[]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
  if req.path.match(/items/)
    item = req.path.split("/items/").last
    item_from_cart = @@items.find{|i|i.name == item}
    resp.write item_from_cart.price
  elsif   @@items.none?{|i|i.name == item}
    resp.write "Item not there"
    resp.status = 400

  else
    resp.write "Route not found"
    resp.status = 404
  end
  # if req.path==""
    resp.finish
  end


end
