require 'rails_helper'

RSpec.describe ChecksumGenerator do
  describe '#generate' do
    let(:input) { 'foo bar baz wibble fizzbuzz fizz buzz' }

    subject { described_class.new(input: input).generate }

    it 'capitalizes each word' do
      expect(subject).to eq('Foobarbazw IbblEfizzb UzzfIzzbUz Z')
    end

    context 'when input has non-English characters' do
      let(:input) { 'foőoőbar' }

      it 'removes them' do
        expect(subject).to eq('Foobar')
      end
    end

    context 'when input has numbers/symbols' do
      let(:input) { '123[f]$#@oo#bar' }

      it 'removes them' do
        expect(subject).to eq('Foobar')
      end
    end

    context 'when text is longer than 10 characters' do
      let(:input) { 'foo bar baz wibble fizzbuzz fizz buzz' }

      it 'breaks it up into 10 character long words' do
        expect(subject).to eq('Foobarbazw IbblEfizzb UzzfIzzbUz Z')
      end
    end
  end
end
