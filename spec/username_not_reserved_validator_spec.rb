require 'spec_helper'

describe UsernameNotReservedValidator do

  let(:reserved_usernames) { UsernameNotReservedValidator::ReservedNames.list }
  let(:valid_username) { 'valid_username' }
  let(:invalid_username) { reserved_usernames.first(30).sample }
  let(:invalid_camelized_username) { reserved_usernames.first(30).sample.camelize }
  let(:invalid_pluralized_username) { reserved_usernames.first(30).sample.pluralize }
  let(:invalid_additional_username) { 'additional_reserved_username' }


  describe 'sample user name' do
    context 'when valid' do
      it 'does not included in reserved list' do
        expect(reserved_usernames.map(&:downcase)).to_not include(valid_username)
        expect(reserved_usernames.map(&:downcase).map(&:pluralize)).to_not include(valid_username)
      end
    end

    context 'when invalid' do
      it 'included in reserved list' do
        expect(reserved_usernames).to include(invalid_username)
      end

      context 'when camelized invalid name' do
        it 'included only downcase list' do
          expect(reserved_usernames).to_not include(invalid_camelized_username)
          expect(reserved_usernames.map(&:downcase)).to include(invalid_camelized_username.downcase)
        end
      end

      context 'when pluarized invalid name' do
        it 'included in pluralized list' do
          expect(reserved_usernames).to include(invalid_pluralized_username.singularize)
        end
      end

      context 'when additional invalid name' do
        it 'does not included in reserved list' do
          expect(reserved_usernames.map(&:downcase)).to_not include(invalid_additional_username)
          expect(reserved_usernames.map(&:downcase).map(&:pluralize)).to_not include(invalid_additional_username)
        end
      end
    end
  end

  shared_examples_for 'accepts username' do
    it { expect(user).to be_valid }
  end

  shared_examples_for 'rejects username' do
    it { expect(user).to_not be_valid }
  end


  describe 'model without validation' do
    subject(:user) { WithoutValidationUser.new(name: username) }

    context 'with valid username' do
      let(:username) { valid_username }
      include_examples 'accepts username'
    end

    context 'with invalid username' do
      let(:username) { invalid_username }
      include_examples 'accepts username'
    end

        context 'with invalid camelized username' do
      let(:username) { invalid_camelized_username }
      include_examples 'accepts username'
    end

    context 'with invalid pluralized username' do
      let(:username) { invalid_pluralized_username }
      include_examples 'accepts username'
    end

    context 'with additionals invalid username' do
      let(:username) { invalid_additional_username }
      include_examples 'accepts username'
    end
  end

  describe 'model with validation' do
    subject(:user) { WithValidationUser.new(name: username) }

    context 'with valid username' do
      let(:username) { valid_username }
      include_examples 'accepts username'
    end

    context 'with invalid username' do
      let(:username) { invalid_username }
      include_examples 'rejects username'
    end

    context 'with invalid camelized username' do
      let(:username) { invalid_camelized_username }
      include_examples 'rejects username'
    end

    context 'with invalid pluralized username' do
      let(:username) { invalid_pluralized_username }
      include_examples 'rejects username'
    end
  end

  describe 'model with case insencitive validation' do
    subject(:user) { WithCaseInsencitiveValidationUser.new(name: username) }

    context 'with valid username' do
      let(:username) { valid_username }
      include_examples 'accepts username'
    end

    context 'with invalid username' do
      let(:username) { invalid_username }
      include_examples 'rejects username'
    end

    context 'with invalid camelized username' do
      let(:username) { invalid_camelized_username }
      include_examples 'accepts username'
    end

    context 'with invalid pluralized username' do
      let(:username) { invalid_pluralized_username }
      include_examples 'rejects username'
    end
  end

  describe 'model with validation and additional reserved username' do
    subject(:user) { WithAdditionalReservedNamesValidationUser.new(name: username) }

    context 'with additionals invalid username' do
      let(:username) { invalid_additional_username }
      include_examples 'rejects username'
    end
  end
end
