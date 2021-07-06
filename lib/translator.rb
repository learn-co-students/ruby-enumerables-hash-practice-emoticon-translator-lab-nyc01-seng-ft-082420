require "yaml"
require "pry"

# def load_library(path)
#   emo_hash = YAML.load_file(path)
  
#   emoticons = emo_hash.each_with_object({}) do |(key, value), emoticons|
#     #grabbing roman names with key, both emoticons are going to be stored in value

#     if !emoticons[key]
#       emoticons[key] = {
#         english: value[0],
#         japanese: value[1]
#       }
#     end

#   end
#   binding.pry
# end

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = {}
  
  emoticons.each do |name, value|
    # binding.pry
    emoticon_hash[name] = {:english => value[0], :japanese => value[1]}
  end
  
  emoticon_hash
end


def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  
  emoticons.each do |feeling, language|
    
    if language[:japanese] == emoticon
      return feeling
    end
    
  end
  
  p "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  
  emoticons.each do |feeling, language|
    
    if language[:english] == emoticon
      return language[:japanese]
    end
    
  end
  
  p "Sorry, that emoticon was not found"
end
