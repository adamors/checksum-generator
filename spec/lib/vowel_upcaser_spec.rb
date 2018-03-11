require 'spec_helper'
require_relative '../../lib/vowel_upcaser'

RSpec.describe VowelUpcaser do
  subject { described_class.call(word: word) }

  describe '#call' do
    context "when the word includes a vowel that's preceded by two consonants and an upcased vowel" do
      let(:word) { 'Abbaixxu' }

      it 'upcases that vowel' do
        expect(subject).to eq('AbbAixxu')
      end
    end

    context "when the word doesn't include any vowels" do
      let(:word) { 'xsdfcg' }

      it 'returns the word unchanged' do
        expect(subject).to eq(word)
      end
    end

    context "when the word doesn't include double consonants" do
      let(:word) { 'Ababababa' }

      it 'returns the word unchanged' do
        expect(subject).to eq(word)
      end
    end
  end
end
