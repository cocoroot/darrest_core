# coding: utf-8
require 'rails_helper'

describe CreateCreationTagLogic, type: :logic do
  before do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, id: 900_000_001, site: site)
    create(:creation, id: 900_000_001, site: site, site_user: site_user)
  end

  describe '#authorize' do
    context 'if Site does not exist,' do
      let(:params) do
        {
          site_id: 900_000_002,
          creation_tag: {
            tag_name: 'Tag Name',
            creation_id: 900_000_001,
            site_id: 900_000_001
          }
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateCreationTagLogic.new.execute(params)

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
          creation_tag: {
            tag_name: 'Tag Name',
            creation_id: 900_000_002,
            site_id: 900_000_001,
          }
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateCreationTagLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:errors][:creation].count).to eq 1
      end
    end
  end # authorize

  describe 'validate' do
    context '型チェックエラー' do
      context 'invalid length of tag_name' do
        let(:params) do
          {
            site_id: 900_000_001,
            creation_tag: {
              tag_name: '!' * 101,
              creation_id: 900_000_001,
              site_id: 900_000_001
            }
          }
        end

        it 'returns error' do
          #
          # exectue
          #
          result = CreateCreationTagLogic.new.validate(params)

          #
          # validate
          #
          expect(result[:errors][:name].count).to eq 1
        end
      end
    end

    context '論理チェックエラー' do
      context '異なるサイトのデータ更新' do
        before do
          create(:site, id: 900_000_002)
        end

        let(:params) do
          {
            site_id: 900_000_002,
            creation_tag: {
              tag_name: 'Tag Name',
              creation_id: 900_000_001,
              site_id: 900_000_001
            }
          }
        end

        it 'returns error' do
          #
          # exectue
          #
          result = CreateCreationTagLogic.new.validate(params)

          #
          # validate
          #
          expect(result[:errors][:creation].count).to eq 1
        end
      end

      context 'すでにつけられているタグ' do
        before do
          create(:tag, id: 900_000_001, name: 'テストタグ', site_id: 900_000_001)
          create(:creation_tag, creation_id: 900_000_001, tag_id: 900_000_001)
        end

        let(:params) do
          {
            site_id: 900_000_001,
            creation_tag: {
              tag_name: 'テストタグ',
              creation_id: 900_000_001,
              site_id: 900_000_001
            }
          }
        end

        it 'returns error' do
          #
          # execute
          #
          result = CreateCreationTagLogic.new.validate(params)

          #
          # validate
          #
          expect(result[:errors][:creation_tag].count).to eq 1
        end
      end
    end
  end # validate

  describe 'execute' do
    context 'normal condition' do
      let(:params) do
        {
          site_id: 900_000_001,
          creation_tag: {
            tag_name: 'Tag Name',
            creation_id: 900_000_001,
            site_id: 900_000_001
          }
        }
      end

      it 'creates a Creation' do
        #
        # execute
        #
        expect { CreateCreationTagLogic.new.execute(params) }.to change { CreationTag.count }.by(1)
      end
    end
  end # execute
end
