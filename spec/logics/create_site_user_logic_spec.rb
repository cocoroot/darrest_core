# coding: utf-8
require 'rails_helper'

include ActionDispatch::TestProcess

describe CreateSiteUserLogic, type: :logic do

  before(:all) do
    create(:user, id: 900_000_001)
    create(:site, id: 900_000_001)
  end

  describe '#authorize' do
    context 'if Site does not exist,' do
      let(:params) do
        {
          site_id: 900_000_002,
          site_user: attributes_for(:site_user, user_id: 900_000_001)
            .slice(:user_id, :biography)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateSiteUserLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:errors][:site].count).to eq 1
      end
    end

    context 'if User does not exist,' do
      let(:params) do
        {
          site_id: 900_000_001,
          site_user: attributes_for(:site_user, user_id: 900_000_002)
            .slice(:user_id, :biography)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateSiteUserLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:errors][:user].count).to eq 1
      end
    end
  end # authorize

  describe 'validate' do
    context '型チェックエラー' do
      let(:params) do
        {
          site_id: 900_000_001,
          site_user: attributes_for(:site_user, biography: 'A' * 10001, user_id: 900_000_001)
            .slice(:user_id, :biography)
        }
      end

      it 'returns error' do
        #
        # exectue
        #
        result = CreateSiteUserLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:biography].count).to eq 1
      end
    end
  end # validate

  describe 'execute' do
    context 'normal condition' do
      let(:params) do
        {
          site_id: 900_000_001,
          site_user: attributes_for(:site_user, user_id: 900_000_001)
            .slice(:user_id, :biography)
        }
      end

      it 'creates a Creation' do
        #
        # execute
        #
        expect { CreateSiteUserLogic.new.execute(params) }.to change { SiteUser.count }.by(1)
      end
    end
  end # execute
end
