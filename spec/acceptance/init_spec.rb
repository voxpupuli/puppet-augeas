# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'augeas class' do
  context 'with default parameters' do
    it_behaves_like 'an idempotent resource' do
      let(:manifest) do
        <<~PUPPET
          class { 'augeas':
          }
        PUPPET
      end
    end
  end
end
