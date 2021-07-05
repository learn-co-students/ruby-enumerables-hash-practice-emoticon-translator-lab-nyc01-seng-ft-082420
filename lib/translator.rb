# require modules here
require "yaml"
require "pry"


def load_library(filepath)
  # code goes here
  emoticons = YAML.load_file(filepath)
  new_emojis = emoticons.each_with_object({}) do |(outer_key, emoji_array), final_hash|
    emoji_array.each_with_index do |emoji, idx|
        if !final_hash[outer_key]
            final_hash[outer_key] = {}
        end
        
        if idx % 2 == 0 
        final_hash[outer_key][:english] = emoji
        else
        final_hash[outer_key][:japanese] = emoji
        end
    
    end
  end
  return new_emojis
end

def get_japanese_emoticon(filename, emoji)

  myhash = load_library(filename)
  message = "Sorry, that emoticon was not found"
  myhash.each do |outer_key, hash|
    hash.each do |inner_key, char|
      if char == emoji
        message = myhash[outer_key][:japanese]
      end
    end
  end
  message
end

def get_english_meaning(filename, jap_emoji)
  myhash = load_library(filename)
  message = "Sorry, that emoticon was not found"
  myhash.each do |outer_key, hash|
    hash.each do |inner_key, char|
      if char == jap_emoji
        message = outer_key
      end
    end
  end
  message
end

