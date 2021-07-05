# require modules here
require "yaml"
require "pry"



def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  labeled_hash = {}
  emoticons.each do |key, value|
    # for each key, if it doesnt exist in labeled hash, create it, key value for each.
    labeled_hash[key] = {}
    labeled_hash[key][:english] = value[0]
    labeled_hash[key][:japanese] = value[1]
  end
  labeled_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  results = "Sorry, that emoticon was not found"
  load_library(file_path).each do |meaning, emoticons|
    emoticons.each do |language, inner_value|
      if inner_value == emoticon
        results = load_library(file_path)[meaning][:japanese]
      end
    end
  end
  results
end


def get_english_meaning(file_path, emoticon)
  results = 'Sorry, that emoticon was not found'# code goes here
  load_library(file_path).each do |meaning, emoticons|
    emoticons.each do |language, inner_value|
      #if language is japanese
      if inner_value == emoticon
        results = meaning
      end
    end
  end
  results
end
