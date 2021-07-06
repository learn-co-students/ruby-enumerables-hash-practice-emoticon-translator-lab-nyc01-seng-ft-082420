# require modules here
require "yaml"
require "pry"

def load_library(lib)
  emoticons = YAML.load(File.read(lib))
  emoticons.map{ |key, value|
    emoticons[key] = {:english => value[0]}
    emoticons[key][:japanese] = value[1]
  }
  emoticons
end

def get_japanese_emoticon(lib, emo)
  ans = ""
  emoticons = load_library(lib)
  emoticons.each { |k, v|
    if v[:english] == emo
      ans = emoticons[k][:japanese]
    end
    }
  if ans != ""
    ans
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(lib,emo)
  ans = ""
  emoticons = load_library(lib)
  emoticons.each { |k, v|
    v.each{ |key, value|
      if value == emo
        ans = k.to_s
      end
    }
  }
  if ans != ""
    ans
  else
    "Sorry, that emoticon was not found"
  end
end