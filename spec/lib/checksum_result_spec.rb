require 'spec_helper'
require_relative '../../lib/checksum_result'

RSpec.describe ChecksumResult do
  subject { described_class.new(word_count: word_count, length: length, text: text) }
  let(:word_count) { input.split.count }
  let(:length) { input.length }

  context 'when text is "Foobarbazw IbblEfizzb UzzfIzzbUz Z"' do
    let(:input) { 'foo bar baz wibble fizzbuzz fizz buzz' }
    let(:text) { 'Foobarbazw IbblEfizzb UzzfIzzbUz Z' }

    describe '#to_s' do
      it 'returns the expected result' do
        expect(subject.to_s).to eq('7-4-5-21-37')
      end
    end

    describe '#newly_created_words' do
      it 'returns the number of newly created words' do
        expect(subject.newly_created_words).to eq(4)
      end
    end

    describe '#upper_case_vowels' do
      it 'returns the number of upper case vowels' do
        expect(subject.upper_case_vowels).to eq(5)
      end
    end

    describe '#consonants' do
      it 'returns the number of consonants' do
        expect(subject.consonants).to eq(21)
      end
    end
  end

  context 'when text is "Thequickbr OwnfOxjUmp Soverthela Zydog"' do
    let(:input) { 'The quick brown fox jumps over the lazy dog' }
    let(:text) { 'Thequickbr OwnfOxjUmp Soverthela Zydog' }

    describe '#to_s' do
      it 'returns the expected result' do
        expect(subject.to_s).to eq('9-4-3-24-43')
      end
    end

    describe '#newly_created_words' do
      it 'returns the number of newly created words' do
        expect(subject.newly_created_words).to eq(4)
      end
    end

    describe '#upper_case_vowels' do
      it 'returns the number of upper case vowels' do
        expect(subject.upper_case_vowels).to eq(3)
      end
    end

    describe '#consonants' do
      it 'returns the number of consonants' do
        expect(subject.consonants).to eq(24)
      end
    end
  end
end
