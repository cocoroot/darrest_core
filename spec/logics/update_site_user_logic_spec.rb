# coding: utf-8
require 'rails_helper'

describe UpdateSiteUserLogic, type: :logic do
  before do
    site = create(:site, id: 900_000_001)
    create(:site_user,
           id: 900_000_001,
           site: site,
           tos_accepted: false,
           site_user_status_id: SiteUserStatus::INTERIM.id)
  end

  let(:params) do
    {
      site_id: 900_000_001,
      site_user: {
        id: 900_000_001,
        biography: '更新バイオグラフィー',
        tos_accepted: true,
        site_user_status_id: SiteUserStatus::REGISTERED.id
      }
    }
  end

  describe 'authorize' do
    context 'if SiteUser does not exist,' do
      before do
        params[:site_user].merge!(id: 900_000_002)
      end

      it 'denies a SiteUser' do
        #
        # execute
        #
        result = UpdateSiteUserLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:site_user].count).to eq 1
      end
    end
  end # authorize

  describe 'validate' do
    context '型チェックエラー' do
      before do
        params[:site_user].merge!(biography: 'A' * 10001)
      end

      it 'returns error' do
        #
        # exectue
        #
        result = UpdateSiteUserLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:biography].count).to eq 1
      end
    end

    context '論理チェックエラー' do
      before do
        create(:site, id: 900_000_002)
        params.merge!(site_id: 900_000_002)
      end

      it 'returns error' do
        #
        # exectue
        #
        result = UpdateSiteUserLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:site_user].count).to eq 1
      end
    end
  end # validate

  describe '#execute' do
    context 'normal condition' do
      it 'update a SiteUser' do
        #
        # execute
        #
        result = UpdateSiteUserLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:site_user].biography).to eq params[:site_user][:biography]
        expect(result[:site_user].tos_accepted).to eq params[:site_user][:tos_accepted]
        expect(result[:site_user].site_user_status_id).to eq params[:site_user][:site_user_status_id]
      end
    end
  end # execute
end
