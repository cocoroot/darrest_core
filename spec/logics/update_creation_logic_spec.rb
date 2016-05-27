# coding: utf-8
require 'rails_helper'

describe UpdateCreationLogic, type: :logic do
  before(:all) do
    params = {
      id: 900_000_001,
      title: 'テストタイトル',
      description: 'テスト内容',
      creation_status: CreationStatus::CREATING
    }
    create(:creation, params)
  end

  let(:params) do
    {
      id: 900_000_001,
      title: 'Test Title',
      description: 'Test Description',
      creation_status: CreationStatus::PUBLISHED
    }
  end

  describe 'authorize' do
    context 'if Creation does not exist,' do
      before do
        params.merge!(id: 900_000_002)
      end

      it 'denies a Creation' do
        #
        # execute
        #
        result = UpdateCreationLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:id].count).to eq 1
      end
    end
  end # authorize

  describe 'validate' do
    context '型チェックエラー' do
      before do
        params.merge!(title: '!' * 201)
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
        expect(result[:creation].title).to eq params[:title]
        expect(result[:creation].description).to eq params[:description]
        expect(result[:creation].creation_status).to eq params[:creation_status]
      end
    end
  end # execute
end
