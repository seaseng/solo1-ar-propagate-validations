get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  #TODO IMPLEMENT ME
  erb :event_new

end

post '/events/create' do
  #TODO IMPLEMENT ME
  @event = Event.create(params)
  puts "Event made: #{Event.last.date}"

  erb :event_created
end
