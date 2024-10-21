require "sinatra"
require "sinatra/reloader"

get '/' do
  redirect '/square/new'
end

# Square calculation
get '/square/new' do
  erb :square_form
end

get '/square/results' do
  @number = params[:number].to_i
  @result = @number ** 2
  erb :square_result
end

# Square root calculation
get '/square_root/new' do
  erb :square_root_form
end

get '/square_root' do
  @number = params[:number].to_f
  @result = Math.sqrt(@number)
  erb :square_root_result
end

# Random number generation
get '/random/new' do
  erb :random_form
end

get '/random/results' do
  @min = params[:minimum].to_i
  @max = params[:maximum].to_i
  @result = rand(@min..@max)
  erb :random_result
end

# Loan payment calculation
get '/payment/new' do
  erb :payment_form
end

get '/payment/results' do
  @apr = params[:apr].to_f
  @monthly_rate = @apr / 100 / 12
  @years = params[:years].to_i
  @principal = params[:principal].to_f

  numerator = @monthly_rate * @principal
  denominator = 1 - (1 + @monthly_rate) ** -(@years * 12)

  @monthly_payment = numerator / denominator
  erb :payment_result
end
