# require modules here
require 'pry'
require 'yaml'


def load_library(file)
  yaml = YAML.load_file(file)
  hash = Hash.new
  yaml.each do |key, value|
    hash[key] = {:english => value[0], :japanese => value[1]}
  end
  hash
end

def get_japanese_emoticon(file, symbol)
  var = nil
  load_library(file).map do |key, value|
    if value[:english] == symbol
      var = value[:japanese]
    end
  end
  if var
    return var
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, symbol)
  var = nil
  load_library(file).map do |key, value|
		if value[:japanese] == symbol
			var = key
		end
	end
	if var
	  return var
	else
	  return "Sorry, that emoticon was not found"
	end
end
