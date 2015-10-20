require 'pry-byebug'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'date'
require_relative 'methods'

get '/multiply/:x/:y' do
  @result = params[:x].to_i * params[:y].to_i
  erb :result
end

get '/' do
  erb :home
end

get '/about_us' do
  erb :about_us
end

get '/faqs' do
  erb :faqs
end

get '/age' do
  if params[:dob]
    @dob = Date.parse(params[:dob])
    @result = calculate_age(@dob)
  end
  erb :age
end

get '/xmas' do
  @result = calculate_xmas
  erb :xmas
end

get '/converter' do
  if params[:number] && params[:unit]
    @number = params[:number].to_f
    @unit = params[:unit]
    @result = unit_converter(@number, @unit)
  end
  erb :converter
end

get '/calculate' do
  @first_number = params[:first_number].to_f
  @second_number = params[:second_number].to_f
  @operator = params[:operator]

  @result = calculate_nums(@first_number, @second_number, @operator)
  erb :result
end