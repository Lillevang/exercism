# Please implement your solution to bob in this file
module Bob
  extend self

    def hey(sentence : String)
      if silence?(sentence)
        "Fine. Be that way!"
      elsif shout?(sentence) && question?(sentence)
        "Calm down, I know what I'm doing!"
      elsif question?(sentence)
        "Sure."
      elsif shout?(sentence)
        "Whoa, chill out!"
      else
        "Whatever."
      end
    end

    def shout?(sentence)
      sentence.matches?(/[A-Z]/) && !sentence.matches?(/[a-z]/)
    end

    def question?(sentence)
      sentence.ends_with?('?')
    end

    def silence?(sentence)
      sentence.gsub(" ", "").size == 0
    end
end