# require modules here
require "yaml"

def load_library(emotes)
lib = {}
  YAML.load_file(emotes).each do |k, v|
    lib[k] = {}

    
    lib[k][:english] = v[0]
    lib[k][:japanese] = v[1]
 end 
 lib
end 

def get_japanese_emoticon(path, emotes)
  
  lib = load_library(path)
    emotes = lib.keys.find do |key|
      lib[key][:english] == emotes
  end
  
  if emotes 
    lib[emotes][:japanese]
  else 
   "Sorry, that emoticon was not found"
  end
end 

def get_english_meaning(path, emotes)
  
  lib = load_library(path)
  emotes = lib.keys.find do |key|
    lib[key][:japanese] == emotes 
  end
  
  if emotes
    emotes 
  else
    "Sorry, that emoticon was not found"
  end 
end