# USERS INDEX
get '/users' do
  @users = User.all
  erb :'users/index'
end

# USERS NEW
get '/users/new' do
  @user = User.new
  erb :'users/new'
end

# USERS CREATE
post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/users'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

# USERS SHOW
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

# USERS EDIT
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end


# USERS UPDATE
put '/users/:id' do
  @user = User.find(params[:id])
  @user.update(params[:user])
  redirect "/users/#{@user.id}"
end


# USERS DESTROY
delete '/users/:id' do
  @user = User.find(params[:id])
  @user.destroy
  redirect "/users"
end
