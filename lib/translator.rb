# require modules here

require 'yaml'
require 'pry'


def load_library(emoticons_file)
  # code goes here
  yaml_unsort = YAML.load_file("./lib/emoticons.yml")
  sorted_hash = {}
  yaml_unsort.each do |key, value|
    sorted_hash[key] = {}
    sorted_hash[key][:english] = value[0]
    sorted_hash[key][:japanese] = value[1]
  end

sorted_hash

end




def get_japanese_emoticon(file, eng_emoji)

  emoticons = load_library(file)
  emoticons.each do |mood, symbols|

    if emoticons[mood][:english] == eng_emoji
      return emoticons[mood][:japanese]

    end
  end
   return "Sorry, that emoticon was not found"
end





def get_english_meaning(emoticons_file, japanese_emoticon)
    lexicon = load_library(emoticons_file)
    sorry_message = "Sorry, that emoticon was not found"
    ret_string = ""


    lexicon.each do |meaning_key, hash_value|
      hash_value.each do |lang_key, emoti_value|
        if emoti_value == japanese_emoticon
          ret_string = meaning_key
          end
	       end
        if ret_string == ""
          ret_string = sorry_message

      end
    end
    ret_string

  end
