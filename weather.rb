#!/usr/bin/env ruby
# frozen_string_literal: true

# Name:     weather.rb
# Desc:     Small CLI script to gather & display weather
# Author:   Drew D. Lenhart
# Project:  https://github.com/dlenhart/weather
#
# Uses Weatherstack.com for weather data by U.S. zipcode
# https://weatherstack.com/documentation

require 'json'
require 'uri'
require 'net/http'
require 'pry'

# CONFIGURATION ####################################
WEATHER_API_BASE = 'http://api.weatherstack.com/'
API_KEY = ''
QUERY = '46774'
DEFAULT_SPACES = 2
DEFAULT_PADDING = 4
####################################################

def weather
  weather = get_weather_data(QUERY)
  response = JSON.parse(weather)

  if response.has_key?('success') && !response['success']
    puts "\n**\nERROR: Issue calling the weather service: \n"
    puts "#{response['error']['info']}\n**\n\n"
    exit 1
  end

  data = format_data(response)
  print_screen(data)
end

def get_weather_data(query, unit = 'f')
  uri = URI("#{url}#{API_KEY}&query=#{query}&units=#{unit}")
  Net::HTTP.get(uri)
rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET,
       EOFError, Net::HTTPClientError, Net::HTTPBadResponse,
       Net::HTTPHeaderSyntaxError, Net::ProtocolError, SocketError => e

  puts "\n**ERROR: Issue calling the weather service: \n\n#{e}**"
end

def url
  "#{WEATHER_API_BASE}/current?access_key="
end

def format_data(data)
  {
    'City' => data['location']['name'],
    'State' => data['location']['region'],
    'Temp' => "#{data['current']['temperature']}°F",
    'Feels Like' => "#{data['current']['feelslike']}°F",
    'Humidity' => "#{data['current']['humidity']}%",
    'Wind Speed' => "#{data['current']['wind_speed']} MPH",
    'Wind Direction' => data['current']['wind_dir'],
    'UV Index' => "#{data['current']['uv_index']} UV"
  }
end

def date_time
  time = Time.new
  date = [
    {
      'date' => time.strftime('%m/%d/%Y %I:%M'),
      'day' => time.strftime('%A')
    }
  ]

  date.first
end

def calculate_spaces(longest, smallest)
  longest - smallest
end

def build_spaces(count)
  "\s" * count
end

def build_chars(count, char)
  char * count
end

def print_today
  time = date_time
  puts "|  Today is: #{time['day']}"
  puts "|  Date: #{time['date']}"
end

def print_screen(data)
  longest_key_name = data.keys.max_by(&:length)
  longest_key = longest_key_name.length + DEFAULT_SPACES
  longest_value = [data.values.max_by(&:length)]

  header = '=======WEATHER=UPDATE'
  dash_bar = '|-'
  footer = '='
  longest_line =
    longest_key_name.length +
    DEFAULT_SPACES +
    longest_value.first.length +
    DEFAULT_PADDING

  puts ' '
  puts header + build_chars(calculate_spaces(longest_line, header.length), '=')

  data.each do |key, value|
    spaces = calculate_spaces(longest_key, key.length)
    puts '| ' + " #{key}:" + build_spaces(spaces) + value.to_s
  end

  puts dash_bar + build_chars(calculate_spaces(longest_line, dash_bar.length), '-')
  print_today
  puts footer + build_chars(calculate_spaces(longest_line, footer.length), '=')
  puts ' '
end

weather
