get '/' do
  session[:monster] = "Cookies!"
  erb :index
end
