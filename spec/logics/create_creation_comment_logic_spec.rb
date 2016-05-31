# coding: utf-8
require 'rails_helper'

include ActionDispatch::TestProcess

describe CreateCreationCommentLogic, type: :logic do

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
          creation_comment: attributes_for(:creation_comment, creation_id: 900_000_001, site_user_id: 900_000_001)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateCreationCommentLogic.new.execute(params)

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
          creation_comment: attributes_for(:creation_comment, creation_id: 900_000_002, site_user_id: 900_000_001)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateCreationCommentLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:errors][:creation].count).to eq 1
      end
    end

    context 'if SiteUser does not exist,' do
      let(:params) do
        {
          site_id: 900_000_001,
          creation_comment: attributes_for(:creation_comment, creation_id: 900_000_001, site_user_id: 900_000_002)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateCreationCommentLogic.new.execute(params)

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
          creation_comment: attributes_for(:creation_comment, body: '!' * 1001, creation_id: 900_000_001, site_user_id: 900_000_001)
        }
      end

      it 'returns error' do
        #
        # exectue
        #
        result = CreateCreationCommentLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:body].count).to eq 1
      end
    end

    context '論理チェックエラー' do
      context 'if Creation and/or SiteUser does not belong to Site,' do
        before do
          create(:site, id: 900_000_002)
        end

        let(:params) do
          {
            site_id: 900_000_002,
            creation_comment: attributes_for(:creation_comment, creation_id: 900_000_001, site_user_id: 900_000_001)
          }
        end

        it 'returns error' do
          #
          # exectue
          #
          result = CreateCreationCommentLogic.new.validate(params)

          #
          # validate
          #
          expect(result[:errors][:creation].count).to eq 1
          expect(result[:errors][:site_user].count).to eq 1
        end
      end
    end
  end # validate

  describe 'execute' do
    context 'normal condition' do
      let(:params) do
        {
          site_id: 900_000_001,
          creation_comment: attributes_for(:creation_comment, creation_id: 900_000_001, site_user_id: 900_000_001)
        }
      end

      it 'creates a Creation' do
        #
        # execute
        #
        expect { CreateCreationCommentLogic.new.execute(params) }.to change { CreationComment.count }.by(1)
      end
    end
  end # execute
end
