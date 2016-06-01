# coding: utf-8
require 'rails_helper'

include ActionDispatch::TestProcess

describe CreateSiteUserHeaderImageLogic, type: :logic do

  before(:all) do
    site = create(:site, id: 900_000_001)
    create(:site_user, id: 900_000_001, site: site)
  end

  describe '#authorize' do
    context 'if Site does not exist,' do
      let(:params) do
        {
          site_id: 900_000_002,
          site_user_header_image: attributes_for(:site_user_header_image, site_user_id: 900_000_001)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateSiteUserHeaderImageLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:errors][:site].count).to eq 1
      end
    end

    context 'if SiteUser does not exist,' do
      let(:params) do
        {
          site_id: 900_000_001,
          site_user_header_image: attributes_for(:site_user_header_image, site_user_id: 900_000_002)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateSiteUserHeaderImageLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:errors][:site_user].count).to eq 1
      end
    end
  end # authorize

  describe 'validate' do
    context '型チェックエラー' do
      let(:params) do
        {
          site_id: 900_000_001,
          site_user_header_image: attributes_for(:site_user_header_image, image_name_for_user: '!' * 257, site_user_id: 900_000_001)
        }
      end

      it 'returns error' do
        #
        # exectue
        #
        result = CreateSiteUserHeaderImageLogic.new.validate(params)
        #
        # validate
        #
        expect(result[:errors][:image_name_for_user].count).to eq 1
      end
    end

    context '論理チェックエラー' do
      before do
        create(:site, id: 900_000_002)
      end

      let(:params) do
        {
          site_id: 900_000_002,
          site_user_header_image: attributes_for(:site_user_header_image, site_user_id: 900_000_001)
        }
      end

      it 'returns error' do
        #
        # exectue
        #
        result = CreateSiteUserHeaderImageLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:site_user].count).to eq 1
      end
    end
  end # validate

  describe 'execute' do
    context 'normal condition' do
      let(:params) do
        {
          site_id: 900_000_001,
          site_user_header_image: attributes_for(:site_user_header_image, site_user_id: 900_000_001)
        }
      end

      it 'creates a SiteUser' do
        #
        # execute
        #
        expect { CreateSiteUserHeaderImageLogic.new.execute(params) }.to change { SiteUserHeaderImage.unscoped.count }.by(1)
      end
    end
  end # execute
end
