# coding: utf-8
require 'rails_helper'

describe DeleteCreationTagLogic, type: :logic do
  before do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, id: 900_000_001, site: site)
    creation = create(:creation, id: 900_000_001, site: site, site_user: site_user)
    create(:creation_tag, id: 900_000_001, creation: creation)
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
        result = DeleteCreationTagLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:site].count).to eq 1
      end
    end

    context 'if CreationTag does not exist,' do
      before do
        params.merge!(id: 900_000_002)
      end

      it 'denies to create' do
        #
        # execute
        #
        result = DeleteCreationTagLogic.new.authorize(params)

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
        result = DeleteCreationTagLogic.new.validate(params)

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
        expect{ DeleteCreationTagLogic.new.execute(params) }.to change { CreationTag.count }.by(-1)
      end
    end
  end # execute
end
