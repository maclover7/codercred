require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create_from_auth_hash' do
    before do
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        provider: 'github',
        info: {
          name: 'Testy Test',
          nickname: 'testytest',
          email: 'testy@test.com'
        }
      })
    end

    it 'returns a new instance of User' do
      result = User.create_from_auth_hash(OmniAuth.config.mock_auth[:github])

      expect(result).to be_an_instance_of(User)
    end
  end
end
