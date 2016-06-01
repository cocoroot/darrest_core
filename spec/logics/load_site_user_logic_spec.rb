# coding: utf-8
require 'rails_helper'

describe LoadSiteUserLogic, type: :logic do
  before(:all) do
    site = create(:site, id: 900_000_001)
    create(:site_user, id: 900_000_001, site: site)
  end

  let(:params) do
    {
      site_id: 900_000_001,
      id: 900_000_001
    }
  end

  describe 'authorize' do
    context 'if Site does not exist,' do
      before do
        params.merge!(site_id: 900_000_002)
      end

      it 'denies a SiteUser' do
        #
        # execute
        #
        result = LoadSiteUserLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:site].count).to eq 1
      end
    end

    context 'if SiteUser does not exist,' do 
      before do
        params.merge!(id: 900_000_002)
      end

      it 'denies a SiteUser' do
        #
        # execute
        #
        result = LoadSiteUserLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:id].count).to eq 1
      end
    end
  end # authorize

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
        result = LoadSiteUserLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:site_user].count).to eq 1
      end
    end
  end # validate

  describe 'execute' do
    context 'normal condition' do
      it 'creates a SiteUser' do
        #
        # execute
        #
        result = LoadSiteUserLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:site_user].id).to eq 900_000_001
      end
    end
  end # execute
end
