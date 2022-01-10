# Please implement your solution to acronym in this file
module Acronym
    extend self

    def abbreviate(input : String)
        input.split(/[\s-_]/)
          .reject(&.empty?)
          .map(&.char_at(0))
          .join.upcase
    end
end