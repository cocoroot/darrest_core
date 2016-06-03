# coding: utf-8
require 'rails_helper'

describe UpdateCreationLogic, type: :logic do
  before do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, site: site, id: 900_000_001)
    params = {
      id: 900_000_001,
      site: site,
      site_user: site_user,
      title: 'テストタイトル',
      description: 'テスト内容',
      creation_status_id: CreationStatus::CREATING.id
    }
    create(:creation, params)
  end

  let(:params) do
    {
      site_id: 900_000_001,
      creation: {
        # site_id: 900_000_001,
        id: 900_000_001,
        title: 'Test Title',
        description: 'Test Description',
        creation_status_id: CreationStatus::PUBLISHED.id
      }
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
        result = UpdateCreationLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:site].count).to eq 1
      end
    end

    context 'if Creation does not exist,' do
      before do
        params[:creation].merge!(id: 900_000_002)
      end

      it 'denies a Creation' do
        #
        # execute
        #
        result = UpdateCreationLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:creation].count).to eq 1
      end
    end
  end # authorize

  describe 'validate' do
    context '型チェックエラー' do
      before do
        params[:creation].merge!(title: '!' * 201)
      end

      it 'returns error' do
        #
        # exectue
        #
        result = UpdateCreationLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:title].count).to eq 1
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
        result = UpdateCreationLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:creation].count).to eq 1
      end
    end
  end # validate

  describe '#execute' do
    context 'normal condition' do
      it 'update a Creation' do
        #
        # execute
        #
        result = UpdateCreationLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:creation].title).to eq params[:creation][:title]
        expect(result[:creation].description).to eq params[:creation][:description]
        expect(result[:creation].creation_status_id).to eq params[:creation][:creation_status_id]
      end
    end
  end # execute
end
