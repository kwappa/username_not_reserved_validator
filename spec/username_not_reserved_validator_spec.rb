require 'spec_helper'

describe UsernameNotReservedValidator do

  let(:reserved_user_names) { UsernameNotReservedValidator::ReservedNames.list.sample(10) }
  let(:valid_user_name) { 'valid_user_name' }

  describe 'reserved name list' do
    it 'does not include sample user name' do
      expect(reserved_user_names.map(&:downcase)).to_not include(valid_user_name)
    end
  end
end
