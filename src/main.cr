require "./tcp.cr"

port = ENV["CL_TCP_PORT"]? || "6768"
cl_dir = ENV["CL_BASE_DIR"]? || "/var/log/commonlogs"
listen = ENV["CL_LISTEN"]? || "0.0.0.0"
debug = ENV["CL_DEBUG"]?.to_s == "true"

puts "Starting syslog server"
puts "TCP listening on 0.0.0.0:#{port}"
puts "Writing to #{cl_dir}"

server = Tcp.new(listen, port.to_i, cl_dir, debug)
server.listen()
