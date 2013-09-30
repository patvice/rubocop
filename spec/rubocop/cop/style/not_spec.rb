# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    module Style
      describe Not do
        subject(:cop) { Not.new }

        it 'registers an offence for not' do
          inspect_source(cop, ['not test'])
          expect(cop.offences.size).to eq(1)
        end

        it 'does not register an offence for !' do
          inspect_source(cop, ['!test'])
          expect(cop.offences).to be_empty
        end

        it 'does not register an offence for :not' do
          inspect_source(cop, ['[:not, :if, :else]'])
          expect(cop.offences).to be_empty
        end
      end
    end
  end
end
