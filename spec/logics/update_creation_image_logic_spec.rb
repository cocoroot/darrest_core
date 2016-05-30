# coding: utf-8
require 'rails_helper'

describe UpdateCreationImageLogic, type: :logic do
  before(:all) do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, site: site, id: 900_000_001)
    creation = create(:creation, id: 900_000_001, site: site, site_user: site_user)
    create(:creation_image, id: 900_000_001, creation: creation)
  end

  describe 'authorize' do
    context 'if Site does not exist,' do
      let(:params) do
        {
          site_id: 900_000_002,
          creation_image: attributes_for(:creation_image, id: 900_000_001)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = UpdateCreationImageLogic.new.execute(params)

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
          creation_image: attributes_for(:creation_image, id: 900_000_001, image_name_for_user: '!' * 257)
        }
      end

      it 'returns error' do
        #
        # exectue
        #
        result = UpdateCreationImageLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:image_name_for_user].count).to eq 1
      end
    end

    context '論理チェックエラー' do
      before do
        create(:site, id: 900_000_002)
        create(:creation_image, id: 900_000_002)
      end

      let(:params) do
        {
          site_id: 900_000_002,
          creation_image: attributes_for(:creation_image, id: 900_000_002, image_name_for_user: '!' * 257)
        }
      end

      it 'returns error' do
        #
        # exectue
        #
        result = UpdateCreationImageLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:creation].count).to eq 1
      end
    end
  end # validate

  describe '#execute' do
    context 'normal condition' do
      let(:params) do
        {
          site_id: 900_000_001,
          creation_image: { id: 900_000_001, image_name_for_user: 'updated.jpg', order: 777 }
        }
      end

      it 'update a Creation' do
        #
        # execute
        #
        result = UpdateCreationImageLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:creation_image].image_name_for_user).to eq params[:creation_image][:image_name_for_user]
        expect(result[:creation_image].order).to eq params[:creation_image][:order]
      end
    end
  end # execute
end
