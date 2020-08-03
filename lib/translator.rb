# require modules here
require "yaml"
require "pry"


def load_library(filepath)
  # code goes here
  data = YAML.load_file(filepath)
    #binding.pry
  inner_keys = [:english, :japanese]  
  data.each do |key, value|
    data[key] = inner_keys.zip(value).to_h
  end  
  data
  #binding.pry
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  data = load_library(path)
  message = "Sorry, that emoticon was not found"
  data.each do |meaning, emos|
    #binding.pry
    if emos[:english] == emoticon
      message = emos[:japanese]
    end 
  end
  message 
end

def get_english_meaning(path, emoticon)
  # code goes here
  data = load_library(path)
  message = "Sorry, that emoticon was not found"
  #binding.pry
  data.each do |meaning, emos|
    #binding.pry
    if emos.has_value?(emoticon)
      message = meaning
    end 
  end
  message 
  #binding.pry
end


