# coding: utf-8
require 'rails_helper'

describe UpdateSiteUserImageLogic, type: :logic do
  before(:all) do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, site: site, id: 900_000_001)
    create(:site_user_image, id: 900_000_001, site_user: site_user)
  end

  describe 'authorize' do
    context 'if Site does not exist,' do
      let(:params) do
        {
          site_id: 900_000_002,
          site_user_image: attributes_for(:site_user_image, id: 900_000_001)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = UpdateSiteUserImageLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:errors][:site].count).to eq 1
      end
    end
  end # authorize

  describe 'validate' do
    context '型チェックエラー' do
      let(:params) do
        {
          site_id: 900_000_001,
          site_user_image: attributes_for(:site_user_image, id: 900_000_001, image_name_for_user: '!' * 257)
        }
      end

      it 'returns error' do
        #
        # exectue
        #
        result = UpdateSiteUserImageLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:image_name_for_user].count).to eq 1
      end
    end

    context '論理チェックエラー' do
      before do
        create(:site, id: 900_000_002)
        create(:site_user_image, id: 900_000_002)
      end

      let(:params) do
        {
          site_id: 900_000_002,
          site_user_image: attributes_for(:site_user_image, id: 900_000_002, image_name_for_user: '!' * 257)
        }
      end

      it 'returns error' do
        #
        # exectue
        #
        result = UpdateSiteUserImageLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:site_user].count).to eq 1
      end
    end
  end # validate

  describe '#execute' do
    context 'normal condition' do
      let(:params) do
        {
          site_id: 900_000_001,
          site_user_image: { id: 900_000_001, image_name_for_user: 'updated.jpg', order: 777, in_use: false }
        }
      end

      it 'update a SiteUser' do
        #
        # execute
        #
        result = UpdateSiteUserImageLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:site_user_image].image_name_for_user).to eq params[:site_user_image][:image_name_for_user]
        expect(result[:site_user_image].order).to eq params[:site_user_image][:order]
        expect(result[:site_user_image].in_use).to eq params[:site_user_image][:in_use]
      end
    end
  end # execute
end
