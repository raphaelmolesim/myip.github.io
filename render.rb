
require "erb"

template = File.read("index.html.erb")

# Render the ERB
renderer = ERB.new(template)

ip_address = `curl https://ipinfo.io/ip`

current_index = File.read("index.html")
return if current_index.include?(ip_address)

context = binding
output = renderer.result(context)

File.open("index.html", "w") do |f|
  f.puts output
end

require_relative 'publish.rb'
