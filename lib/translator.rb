require 'yaml'
require 'pry'

def load_library(file)
  emoticons = YAML.load_file(file)
  emoji_hash = {}
  
  emoticons.each do | feeling, characters |
    emoji_hash[feeling] =  {}
    emoji_hash[feeling][:english] =  characters[0]
    emoji_hash[feeling][:japanese] = characters[1]
    
    
  end
  emoji_hash
end

def get_japanese_emoticon(file, eng_emoji)
  
  emoticons = load_library(file)
  emoticons.each do | mood, symbols |
    
    if emoticons[mood][:english] == eng_emoji
      return emoticons[mood][:japanese]
    
    end
  end
   return "Sorry, that emoticon was not found" 
end

def get_english_meaning(file, jap_emoji)
  
  emoticons = load_library(file)
  emoticons.each do | mood, symbols | 
   
    if emoticons[mood][:japanese] == jap_emoji
      return mood
    end
  end
  return "Sorry, that emoticon was not found"
end