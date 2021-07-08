# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  translator = YAML.load_file(file_path)
  translator.each do |key, value|
    english_emoticon = value[0]
    japanese_emoticon = value[1]
    translator[key] = {}
    translator[key][:english] = english_emoticon
    translator[key][:japanese] = japanese_emoticon
  end
  translator
end

def get_japanese_emoticon(file_path, english_emoticon)
  translator = load_library(file_path)
  translator.each do |key, value|
    if value[:english] == english_emoticon
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"

end

def get_english_meaning(file_path, japanese_emoticon)
  translator = load_library(file_path)
  translator.each do |key, value|
    if value[:japanese] == japanese_emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end
