# require modules here
require 'yaml'
require 'pry'

def load_library(emoticon_lib)
  emoticons = YAML.load_file(emoticon_lib)
    emoticon_hash = {}
  emoticons.each do |key, value|
    #binding.pry
    emoticon_hash[key] = {}
    emoticon_hash[key][:english] = value[0]
    emoticon_hash[key][:japanese] = value[1]
  end
  emoticon_hash
end


def get_japanese_emoticon(emoticon_file, emoticon)
  emoticon_lib = load_library(emoticon_file)
  emoticon_lib.each do |key|
    #binding.pry
    if key[1][:english] == emoticon
      return key[1][:japanese]
    end
  end
  return 'Sorry, that emoticon was not found'
end

def get_english_meaning(emoticon_file, emoticon)
  emoticon_lib = load_library(emoticon_file)
  emoticon_lib.each do |key|
    #binding.pry
    if key[1][:japanese] == emoticon
      return key[0]
    end
  end
  return 'Sorry, that emoticon was not found'
end
