class Kitten < ApplicationRecord
  validates :name, presence: { message: "You really must be dumb forgetting the name of your cat. Try again." }
  validates :age, numericality: { in: (1..30), message: "Tell us your cat's real age. Be honest" }
  validates :cuteness, presence: { message: "How cute is they?" }
  validates :softness, presence: { message: "How plush is they?" }
end
