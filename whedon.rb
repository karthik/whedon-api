require 'json'
require 'sinatra'

# Before we handle the request we extract the issue body to grab the whedon
# command (if present).
before do
  params = JSON.parse(request.env["rack.input"].read)
  # Only work with issues. Halt if there isn't an issue in the JSON
  puts "DEBUG: #{params}"
  halt if params['issue'].nil?
  @message = params['issue']['body']
end

post '/dispatch' do
  case @message
  when /commands/i
    puts "I have all the commands"
  else
    puts "You make no sense human"
  end
end