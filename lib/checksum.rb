require_relative 'vowel_upcaser'
require_relative 'checksum_result'
require_relative 'string_refinements'
# Class for generating the checkum of an input text
class Checksum
  using StringRefinements

  def initialize(input:)
    @input = input
  end

  def generate
    input.gsub(/[^a-z]+/i, '')
         .scan(/.{1,10}/)
         .map(&:capitalize)
         .map { |word| VowelUpcaser.call(word: word) }
         .join(' ')
  end

  private

  def checksum_result(text)
    ChecksumResult.new(
      word_count: input.word_count,
      length: input.length,
      text: text
    ).to_s
  end

  attr_reader :input
end