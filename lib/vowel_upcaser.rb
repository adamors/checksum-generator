# Upcase vowels in a word based on rules
class VowelUpcaser
  using StringRefinements

  def self.call(word:)
    new(word).call
  end

  def initialize(word)
    @consonant_count = 0
    @characters = word.split('')
  end

  def call
    characters.map do |character|
      unless character.vowel?
        @consonant_count += 1
        next character
      end
      if consonant_count < 2
        @previous_upper_case_vowel = character.upper_case?
        next character
      end
      @consonant_count = 0
      previous_upper_case_vowel ? character.upcase : character
    end.join
  end

  private

  attr_reader :consonant_count, :previous_upper_case_vowel, :characters
end
