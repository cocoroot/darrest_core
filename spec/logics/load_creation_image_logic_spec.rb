# coding: utf-8
require 'rails_helper'

describe LoadCreationImageLogic, type: :logic do
  before(:all) do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, id: 900_000_001, site: site)
    creation = create(:creation, id: 900_000_001, site: site, site_user: site_user)
    create(:creation_image, id: 900_000_001, creation: creation)
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

      it 'denies a Creation' do
        #
        # execute
        #
        result = LoadCreationImageLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:site].count).to eq 1
      end
    end

    context 'if CreationImage does not exist,' do 
      before do
        params.merge!(id: 900_000_002)
      end

      it 'denies to create' do
        #
        # execute
        #
        result = LoadCreationImageLogic.new.authorize(params)

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
        result = LoadCreationImageLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:creation].count).to eq 1
      end
    end
  end # validate

  describe 'execute' do
    context 'normal condition' do
      it 'creates a Creation' do
        #
        # execute
        #
        result = LoadCreationImageLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:creation_image].id).to eq 900_000_001
      end
    end
  end # execute
end
