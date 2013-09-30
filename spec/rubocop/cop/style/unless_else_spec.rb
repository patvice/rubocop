# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    module Style
      describe UnlessElse do
        subject(:cop) { UnlessElse.new }

        it 'registers an offence for an unless with else' do
          inspect_source(cop, ['unless x',
                               '  a = 1',
                               'else',
                               '  a = 0',
                               'end'])
          expect(cop.messages).to eq(
            ['Never use unless with else. Rewrite these with the ' +
             'positive case first.'])
        end

        it 'accepts an unless without else' do
          inspect_source(cop, ['unless x',
                               '  a = 1',
                               'end'])
          expect(cop.messages).to be_empty
        end
      end
    end
  end
end
