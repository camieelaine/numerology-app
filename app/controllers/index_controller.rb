require 'sinatra'

get '/:birthdate' do
  setup_index_view
end

#Adding the route get ‘/message/:birth_path_num’ to allow the user to enter a birth_path_num (a number 1-9) and get the 
#corresponding message. Similar to the code in setup_index_view, but skips the calculation for birth_path_num b/c it comes from the params hash.
get '/message/:birth_path_num' do
  birth_path_num = params[:birth_path_num].to_i
  @message = Person.get_message(birth_path_num)
  erb :index
end

#Adding a route that gets the form.erb (use the erb template form.erb)
get '/' do
  erb :form
end

post '/' do
  birthdate = params[:birthdate].gsub("-","")
    if Person.valid_birthdate(birthdate)
      birth_path_num = Person.get_birth_path_num(birthdate)
      redirect "/message/#{birth_path_num}"
    else
      @error = "Oops! You should enter a valid birthdate in the form of mmddyyyy. Try again!"
      erb :form    
    end
  end

 #Create setup_index_view method to refactor code - take duplicate code from get '/:birthdate' and post '/' do
def setup_index_view
  birthdate = params[:birthdate]
  birth_path_num = Person.get_birth_path_num(birthdate)
  @message = Person.get_message(birth_path_num)
  erb :index
end
