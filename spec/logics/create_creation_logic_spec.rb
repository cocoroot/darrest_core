# coding: utf-8
require 'rails_helper'

describe CreateCreationLogic, type: :logic do

  before(:all) do
    site = create(:site, id: 900_000_001)
    create(:site_user, id: 900_000_001, site: site)
  end

  let(:params) do
    {
      site_id: 900_000_001,
      creation: {
        site_user_id: 900_000_001,
        title: 'テストタイトル',
        description: 'テスト内容',
        creation_status: CreationStatus::CREATING
      }
    }
  end

  describe '#authorize' do
    context 'if Site does not exist,' do
      before do
        params.merge!(site_id: 900_000_002)
      end

      it 'denies a Creation' do
        #
        # execute
        #
        result = CreateCreationLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:errors][:site].count).to eq 1
      end
    end

    context 'if SiteUser does not exist,' do
      before do
        params[:creation].merge!(site_user_id: 900_000_002)
      end

      it 'denies a Creation' do
        #
        # execute
        #
        result = CreateCreationLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:site_user].count).to eq 1
      end
    end
  end # authorize

  describe 'validate' do
    let(:params) do
      {
        site_id: 900_000_001,
        creation: {
          site_user_id: 900_000_001,
          title: 'テストタイトル',
          description: 'テスト内容',
          creation_status: CreationStatus::CREATING
        }
      }
    end

    context '型チェックエラー' do
      before do
        params[:creation].merge!(title: '!' * 201 )
      end

      it 'returns error' do
        #
        # exectue
        #
        result = CreateCreationLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:title].count).to eq 1
      end
    end

    context '論理チェックエラー' do
      before do
        params[:creation].merge!(site_id: 900_000_001, site_user_id: 900_000_002)
      end

      it 'returns error' do
        #
        # exectue
        #
        result = CreateCreationLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:site_user].count).to eq 1
      end
    end
  end # validate

  describe 'execute' do
    context 'normal condition' do
      it 'creates a Creation' do
        #
        # execute
        #
        expect { CreateCreationLogic.new.execute(params) }.to change { Creation.count }.by(1)
      end
    end
  end # execute
end
