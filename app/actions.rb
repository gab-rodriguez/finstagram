get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end

#render signup.erb when user navigates to /signup path
get '/signup' do
  @user = User.new
  erb(:signup)      
end

#show below text when the form is submitted
post '/signup' do

  # grab user input values from params
  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]

  # instantiate a User
  user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })

  # if user validations pass and user is saved
  if user.save

    # return readable representation of User object
    escape_html user.inspect

  else

    # display error messages
    escape_html user.errors.full_messages
  end
end