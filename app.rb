require "sinatra"
require "sinatra/reloader"

# Square calculation
get '/square/new' do
  erb :square_form
end

post '/square' do
  number = params[:number].to_i
  @result = number ** 2
  erb :square_result
end

# Square root calculation
get '/square_root/new' do
  erb :square_root_form
end

post '/square_root' do
  number = params[:number].to_f
  @result = Math.sqrt(number)
  erb :square_root_result
end

# Random number generation
get '/random/new' do
  erb :random_form
end

post '/random' do
  min = params[:min].to_i
  max = params[:max].to_i
  @result = rand(min..max)
  erb :random_result
end

# Loan payment calculation
get '/payment/new' do
  erb :payment_form
end

post '/payment' do
  apr = params[:apr].to_f / 100 / 12
  years = params[:years].to_i * 12
  present_value = params[:present_value].to_f

  numerator = apr * present_value
  denominator = 1 - (1 + apr) ** -years

  @monthly_payment = numerator / denominator
  erb :payment_result
end
