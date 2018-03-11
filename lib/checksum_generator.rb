# Class for generating the checkum of an input text
class ChecksumGenerator
  using StringRefinements

  def initialize(input:)
    @input = input
  end

  def generate
    input.gsub(/[^a-z]+/i, '')
         .scan(/.{1,10}/)
         .map(&:capitalize)
         .map { |word| VowelUpcaser.call(word: word) }
         .join(' ').tap { |text| return checksum_result(text) }
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
