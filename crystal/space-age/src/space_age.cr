module Space
  class Age
    YEAR_IN_SECONDS = 31_557_600
    MERCURY = 0.2408467
    VENUS = 0.61519726
    MARS = 1.8808158
    JUPITER = 11.862615
    SATURN = 29.447498
    URANUS = 84.016846
    NEPTUNE = 164.79132

    def self.from_seconds(seconds : Float64)
        age = seconds / YEAR_IN_SECONDS
        new(age)
    end

    def initialize(@age : Float64)
    end

    def age_on_earth
        @age
    end

    # Macro for all the planets
    {% begin %}
        {% for planet in %w[MERCURY VENUS MARS JUPITER SATURN URANUS NEPTUNE] %}
            def age_on_{{planet.id.downcase}}
                @age / {{planet.id}}
            end
        {% end %}
    {% end %}
  end
end
