# coding: utf-8
require 'rails_helper'

include ActionDispatch::TestProcess

describe CreateCreationImageLogic, type: :logic do

  before(:all) do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, id: 900_000_001, site: site)
    create(:creation, id: 900_000_001, site: site, site_user: site_user)
  end

  describe '#authorize' do
    context 'if Site does not exist,' do
      let(:params) do
        {
          site_id: 900_000_002,
          creation_image: attributes_for(:creation_image, creation_id: 900_000_001)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateCreationImageLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:errors][:site].count).to eq 1
      end
    end
    
    context 'if Creation does not exist,' do
      let(:params) do
        {
          site_id: 900_000_001,
          creation_image: attributes_for(:creation_image, creation_id: 900_000_002)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateCreationImageLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:errors][:creation].count).to eq 1
      end
    end
  end # authorize

  describe 'validate' do
    context '型チェックエラー' do
      let(:params) do
        {
          site_id: 900_000_001,
          creation_image: attributes_for(:creation_image, image_name_for_user: '!' * 257, creation_id: 900_000_001)
        }
      end

      it 'returns error' do
        #
        # exectue
        #
        result = CreateCreationImageLogic.new.validate(params)
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
          creation_image: attributes_for(:creation_image, creation_id: 900_000_001)
        }
      end

      it 'returns error' do
        #
        # exectue
        #
        result = CreateCreationImageLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:creation].count).to eq 1
      end
    end
  end # validate

  describe 'execute' do
    context 'normal condition' do
      let(:params) do
        {
          site_id: 900_000_001,
          creation_image: attributes_for(:creation_image, creation_id: 900_000_001)
        }
      end

      it 'creates a Creation' do
        #
        # execute
        #
        expect { CreateCreationImageLogic.new.execute(params) }.to change { CreationImage.count }.by(1)
      end
    end
  end # execute
end
