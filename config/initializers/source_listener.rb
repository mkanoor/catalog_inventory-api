# Be sure to restart your server when you modify this file.

unless defined?(::Rails::Console)
  queue_host = ENV["QUEUE_HOST"] || "localhost"
  queue_port = ENV["QUEUE_PORT"] || 9092
  
  source_listener = Events::SourceListener.new(:host => queue_host, :port => queue_port)
  source_listener.run
end
  
