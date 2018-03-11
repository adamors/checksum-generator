require_relative 'string_refinements'
# Value object for the checksum result
class ChecksumResult
  using StringRefinements

  def initialize(word_count:, length:, text:)
    @word_count = word_count
    @length = length
    @text = text
  end

  def to_s
    "#{original_words}-#{newly_created_words}-#{upper_case_vowels}-#{consonants}-#{original_length}"
  end

  def original_words
    @word_count
  end

  def newly_created_words
    text.word_count
  end

  def upper_case_vowels
    text.scan(/[AEIOU]/).count
  end

  def consonants
    text.scan(/[^aeiou\s]/i).count
  end

  def original_length
    @length
  end

  private

  attr_reader :text
end
