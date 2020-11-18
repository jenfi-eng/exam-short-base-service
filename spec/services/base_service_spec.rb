require 'rails_helper'

RSpec.describe BaseService, type: :module do
  let(:simple_success) do
    Class.new do
      include BaseService
    end
  end

  let(:account_create) do
    Class.new do
      include BaseService
      # Allows calling Factory bot (i.e. create :account)
      include FactoryBot::Syntax::Methods
    end
  end

  describe 'your specs here' do
  end
end
