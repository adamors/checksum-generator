require 'rails_helper'

RSpec.describe ChecksumGenerator do
  describe '#generate' do
    let(:input) { 'foo bar baz wibble fizzbuzz fizz buzz' }

    subject { described_class.new(input: input).generate }

    it 'generates the expected output' do
      expect(subject).to eq('7-4-5-21-37')
    end
  end
end
