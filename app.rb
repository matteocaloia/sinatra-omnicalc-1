require "sinatra"
require "sinatra/reloader"

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/square/results") do
  @num = params.fetch("users_number").to_f
  @result = @num ** 2
  erb(:square_result)
end

get("/square_root/new") do
  erb(:new_squareroot_calc)
end

get("/square_root/square/results") do
  @num = params.fetch("users_number").to_f
  @result = @num ** 0.5
  erb(:square_root_result)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/payment/results") do
  @apr = (params.fetch("users_apr").to_f/100)
  @num_years = params.fetch("users_years").to_f
  @principal = params.fetch("users_principal").to_f
  @months = @num_years*12
  @rate = @apr/12
  @apr_percent = @apr*100
  @principal_curr = @principal.to_fs(:currency)
  @payment = (@rate * @principal) / (1 - ((1 + @rate)**(-@months)))
  @payment_curr = @payment.to_fs(:currency)
  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random_calc)
end

get("/random/random/results") do
  @minimum = params.fetch("minimum").to_f
  @maximum = params.fetch("maximum").to_f
  @random = rand(@minimum..@maximum)
  erb(:random_result)
end

get("/") do
  erb(:new_square_calc)
end


