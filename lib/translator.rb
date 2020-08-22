require "yaml"
emoticons = YAML.load_file('./lib/emoticons.yml')


def 
  
  load_library(file)
  
  
  emoticons = YAML.load_file('./lib/emoticons.yml')
                             puts emoticons.inspect

  hash_slinger = emoticons.each_with_object({}) do
               |(key, value), hash_out|

    if !hash_out[key] 

        hash_out[key] = 
      {
        :english  => value[0],
        :japanese => value[1]
      }

    end

    hash_slinger
    # // lol xD //
                                                end


end




def 
  
  get_japanese_emoticon(file, english_emoji)
                 
      #           emoji_in = english_emoji
      puts
      puts ":: #{english_emoji}"
      puts
      
  english_REF = load_library(file)

      shrug = "Sorry, that emoticon was not found"
      #  x-x  shrug = "idek what that means Fam  :T . . ."
  
  english_REF.each do |value, meaning|
    if         english_REF[value][:english] == english_emoji
        return english_REF[value][:japanese]             end
                   end

return shrug


end




def 
  
  get_english_meaning(file, japenese_emoji)
                 
      #           emoji_in = japenese_emoji
      puts
      puts ":: #{japenese_emoji}"
      puts
      
  japanese_REF = load_library(file)

      shrug = "Sorry, that emoticon was not found"
      #  x-x  shrug = "idek what that means Fam  :T . . ."

  japanese_REF.each do |value, meaning|
    if  japanese_REF[value][:japanese] == japenese_emoji
        return value                                 end
                    end

  return shrug


end

