require 'pry-byebug'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'date'
require_relative 'methods'

def calculate_age(dob)
 today = Date.today
 out = case
 when dob > today
   "That date is in the future, so not much use for calculating age from..."
 else
   age = today.year - dob.year - ((today.month > dob.month || (today.month == dob.month && today.day >= dob.day)) ? 0 : 1)

   case age
   when 0
     "Not even one-year-old yet"
   when 1..99
     "If that was your birthday, you would be #{age} year#{'s' if age > 1} old now."
   else
     "If that was your birthday, you would be #{age} years old now. And looking pretty good on it!"
   end
 end
end

def calculate_xmas
  today = Date.today

  # Uncomment for testing purposes to get a fake 'today'
  # today = (Date.new(today.year, 1, 1).. Date.new(today.year, 12, 31)).to_a.sample

  christmas = Date.new(today.year, 12, 25)
  sleeps = (christmas - today).to_i

  output = case sleeps.to_i
  when 0
    "OMG! Check your stockings! Santa's been!!"
  when 1..10
    "Only #{sleeps} sleep#{'s' unless sleeps == 1} to go. It's getting close!"
  when 11..24
    "The advent calendar is getting a workout with only #{sleeps} sleeps to go."
  when 25..54
    "#{sleeps} sleeps until Christmas. Better get the cards for Australian friends written."
  when 55..100
    "#{sleeps} sleeps. Check back soon."
  when 101..250
    "You're too keen. I feel almost mean telling you there's #{sleeps} sleeps still left."
  when 251..366
    "It's hardly even Easter! There still #{sleeps} sleeps until Christmas."
  else
    "Oh noes! You missed it! Gotta wait until next year now :-("
  end
end

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

get '/calculate' do
  @first_number = params[:first_number].to_f
  @second_number = params[:second_number].to_f
  @operator = params[:operator]

  @result = case @operator
  when '+'
    @first_number + @second_number
  when '-'
    @first_number - @second_number
  when '*'
    @first_number * @second_number
  when '/'
    @first_number / @second_number
  end
  erb :result
  end