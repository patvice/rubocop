# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    module Style
      describe SpaceAfterColon do
        subject(:cop) { SpaceAfterColon.new }

        it 'registers an offence for colon without space after it' do
          inspect_source(cop, ['x = w ? {a:3}:4'])
          expect(cop.messages).to eq(
            ['Space missing after colon.'] * 2)
        end

        it 'allows the colons in symbols' do
          inspect_source(cop, ['x = :a'])
          expect(cop.messages).to be_empty
        end

        it 'allows colons in strings' do
          inspect_source(cop, ["str << ':'"])
          expect(cop.messages).to be_empty
        end
      end
    end
  end
end
