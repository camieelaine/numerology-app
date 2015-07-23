#Controller to show all the people
get '/people' do
  @people = Person.all
  erb :"/people/index"
end

#Controller to show the form to add a new person record
get '/people/new' do
  @person = Person.new
  erb :"/people/new"
end

#Controller to add a new person record to the database
post '/people' do
  if params[:birthdate].include?("-")
    birthdate = params[:birthdate]
  else
    birthdate = Date.strptime(params[:birthdate], "%m%d%Y")
  end
  
  person = Person.create(first_name: params[:first_name], last_name: params[:last_name], birthdate: birthdate)
  redirect "/people/#{person.id}"
end

#Controller to show the form to edit a person record
get '/people/:id/edit' do
  @person = Person.find(params[:id])
  erb :"/people/edit"
end

#Controller to update a person record in the database
put '/people/:id' do
  person = Person.find(params[:id])
  person.first_name = params[:first_name]
  person.last_name = params[:last_name]
  person.birthdate = params[:birthdate]
  person.save
  redirect "/people/#{person.id}"
end

#Controller to delete a person record in the database
delete '/people/:id' do
  person = Person.find(params[:id])
  person.delete
  redirect "/people"
end

#Controller to retrieve a person record from the database and show the record
get '/people/:id' do
  @person = Person.find(params[:id])
  birth_path_num = Person.get_birth_path_num(@person.birthdate.strftime("%m%d%Y"))
  @message = Person.get_message(birth_path_num)  
  erb :"/people/show"
end
