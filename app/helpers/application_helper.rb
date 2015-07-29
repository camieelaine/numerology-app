module ApplicationHelper
#Helper method called people_form_action which takes in a person as an argument, then checks if the person 
#is a new record.
#Set a variable @action to the appropriate route for each case of the if statement.
	def people_form_action(person)
		if person.new_record?
			@action = "/people"
		else
			@action = "/people/#{person.id}"
		end
		@action
	end

	#Set hidden _method value in form to post or put
	def people_form_method(person)
		if person.new_record?
			@method = "post"
		else
			@method = "put"
		end
		@method
	end
#Define which css class to use
	def people_form_class(person)
	    if person.new_record?
	      @class = "new-person"
	    else
	      @class = "edit-person"
	    end
	    @class
	end
	
	def people_form_id(person)
	    if person.new_record?
	      @form_id = "new-person"
	    else
	      @form_id = "person-#{person.id}"
	    end
	    @form_id
	 end
end
