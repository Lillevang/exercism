@[Flags]
enum Allergies
  Eggs
  Peanuts
  Shellfish
  Strawberries
  Tomatoes
  Chocolate
  Pollen
  Cats

  def self.allergic_to(allergin, score)
    new(score).includes?(parse(allergin))
  end

  def self.list(score)
    new(score).to_s.downcase.split(" | ")- ["none"]
  end
end
