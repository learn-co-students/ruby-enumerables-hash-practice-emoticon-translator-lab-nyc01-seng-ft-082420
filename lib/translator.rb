# require modules here
require "yaml"

def load_library(file)
  result = {}
  file = YAML.load_file(file)
  file.each do |key, value|
    result[key] = {
      :english => value[0],
      :japanese => value[1]
    }
  end
  result
end

def get_japanese_emoticon(file, emoji)
  translator = load_library(file)
  translator.each do |key, value|
    if value[:english] == emoji
      return value[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoji)
  translator = load_library(file)
  translator.each do |key, value|
    if value[:japanese] == emoji
      return key
    end
  end
  "Sorry, that emoticon was not found"
end
