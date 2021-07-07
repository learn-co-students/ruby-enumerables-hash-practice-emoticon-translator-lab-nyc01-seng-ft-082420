require "yaml"
require "pry"


def load_library(file)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  result = emoticons.each_with_object({}) do |(key, value), final_hash|
    if !final_hash[key] 
      final_hash[key] = {
        :english => value[0],
        :japanese => value [1]
      }
    end
    result
  end
  # binding.pry
end

def get_japanese_emoticon(file,english_emoji)
  library = load_library(file)
  message = "Sorry, that emoticon was not found"
  library.each do |value, meaning|
    if library[value][:english] == english_emoji
      return library[value][:japanese]
    end
  end
return message
end

def get_english_meaning(file, japenese_emoji)
  library = load_library(file)
  message = "Sorry, that emoticon was not found"
  library.each do |value, meaning|
    if library[value][:japanese] == japenese_emoji
      return value
    end
  end
  return message
end

