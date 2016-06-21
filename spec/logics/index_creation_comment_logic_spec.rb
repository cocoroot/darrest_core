# coding: utf-8
require 'rails_helper'

describe IndexCreationCommentLogic, type: :logic do
  before do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, id: 900_000_001, site: site)
    create(:creation, id: 900_000_001, site: site, site_user: site_user)
  end

  let(:params) do
    {
      site_id: 900_000_001,
      creation_id: 900_000_001
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
        result = IndexCreationCommentLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:site].count).to eq 1
      end
    end

    context 'if Creation does not exist,' do
      before do
        params.merge!(creation_id: 900_000_002)
      end

      it 'denies a Creation' do
        #
        # execute
        #
        result = IndexCreationCommentLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:creation].count).to eq 1
      end
    end
  end

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
        result = IndexCreationCommentLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:creation].count).to eq 1
      end
    end
  end # validate

  describe 'execute' do
    before do
      create(:site_user, id: 900_000_002, site_id: 900_000_001)
      create(:site_user, id: 900_000_003, site_id: 900_000_001)
      create(:creation_comment, creation_id: 900_000_001, site_user_id: 900_000_001, body: 'コメント')
      create(:creation_comment, creation_id: 900_000_001, site_user_id: 900_000_002, body: 'コメント')
      create(:creation_comment, creation_id: 900_000_001, site_user_id: 900_000_003, body: 'コメント')
    end

    context 'normal condition' do
      it 'creates a Creation' do
        #
        # execute
        #
        comments = IndexCreationCommentLogic.new.execute(params)

        #
        # validate
        #
        expect(comments.count).to eq 3
      end
    end
  end # execute
end
