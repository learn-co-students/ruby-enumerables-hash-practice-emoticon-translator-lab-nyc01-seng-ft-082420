# require modules here
require "yaml"

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  emoticon_hash= {}
  
  emoticons.each do |key, value|
    emoticon_hash[key] = {}
    emoticon_hash[key][:english]= value[0]
    emoticon_hash[key][:japanese] = value[1]
  end
  emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
   lib = load_library(file_path)
  emoticon = lib.keys.find do |key|
    lib[key][:english] == emoticon
  end
  emoticon ? lib[emoticon][:japanese] : "Sorry, that emoticon was not found"
end


def get_english_meaning(file_path, emoticon)
  # code goes here
  lib = load_library(file_path)
  emoticon = lib.keys.find do |key|
    lib[key][:japanese] == emoticon
  end
  emoticon ? emoticon : "Sorry, that emoticon was not found"
end