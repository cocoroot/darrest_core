# coding: utf-8
require 'rails_helper'

describe IndexGoodByUserLogic, type: :logic do
  before(:all) do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, id: 900_000_001, site: site)
    create(:creation, id: 900_000_001, site: site, site_user: site_user)
  end

  let(:params) do
    {
      site_id: 900_000_001,
      site_user_id: 900_000_001
    }
  end

  describe 'authorize' do
    context 'if Site does not exist,' do
      before do
        params.merge!(site_id: 900_000_002)
      end

      it 'denies a Creation' do
        #
        # execute
        #
        result = IndexGoodByUserLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:site].count).to eq 1
      end
    end

    context 'if SiteUser does not exist,' do
      before do
        params.merge!(site_user_id: 900_000_002)
      end

      it 'denies a Creation' do
        #
        # execute
        #
        result = IndexGoodByUserLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:site_user].count).to eq 1
      end
    end
  end

  describe 'validate' do
    context '論理チェックエラー' do
      before do
        create(:site, id: 900_000_002)
        params.merge!(site_id: 900_000_002)
      end

      it 'returns error' do
        #
        # exectue
        #
        result = IndexGoodByUserLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:site_user].count).to eq 1
      end
    end
  end # validate

  describe 'execute' do
    before do
      create(:site_user, id: 900_000_002, site_id: 900_000_001)
      create(:site_user, id: 900_000_003, site_id: 900_000_001)
      create(:good, creation_id: 900_000_001, site_user_id: 900_000_001)
      create(:good, creation_id: 900_000_001, site_user_id: 900_000_002)
      create(:good, creation_id: 900_000_001, site_user_id: 900_000_003)
    end

    context 'normal condition' do
      it 'creates a Creation' do
        #
        # execute
        #
        goods = IndexGoodByUserLogic.new.execute(params)

        #
        # validate
        #
        expect(goods.count).to eq 3
      end
    end
  end # execute
end
