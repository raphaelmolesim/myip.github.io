
require "erb"

template = File.read("index.html.erb")

# Render the ERB
renderer = ERB.new(template)

ip_address = "192.186.0.1"

context = binding
output = renderer.result(context)

File.open("index.html", "a") do |f|
  f.puts output
end
