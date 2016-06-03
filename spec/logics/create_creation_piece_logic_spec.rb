# coding: utf-8
require 'rails_helper'

describe CreateCreationPieceLogic, type: :logic do
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
          creation_piece: attributes_for(:creation_piece, creation_id: 900_000_001)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateCreationPieceLogic.new.execute(params)

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
          creation_piece: attributes_for(:creation_piece, creation_id: 900_000_002)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateCreationPieceLogic.new.execute(params)

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
          creation_piece: attributes_for(:creation_piece,
                                         name: 'A' * 201,
                                         file_name_for_user: 'A' * 257,
                                         image_name_for_user: 'A' * 257,
                                         creation_id: 900_000_001)
        }
      end

      it 'returns error' do
        #
        # exectue
        #
        result = CreateCreationPieceLogic.new.validate(params)
        #
        # validate
        #
        expect(result[:errors][:name].count).to eq 1
        expect(result[:errors][:image_name_for_user].count).to eq 1
        expect(result[:errors][:file_name_for_user].count).to eq 1
      end
    end

    context '論理チェックエラー' do
      before do
        create(:site, id: 900_000_002)
      end

      let(:params) do
        {
          site_id: 900_000_002,
          creation_piece: attributes_for(:creation_piece, creation_id: 900_000_001)
        }
      end

      it 'returns error' do
        #
        # exectue
        #
        result = CreateCreationPieceLogic.new.validate(params)

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
          creation_piece: attributes_for(:creation_piece, creation_id: 900_000_001)
        }
      end

      it 'creates a Creation' do
        #
        # execute
        #
        expect { CreateCreationPieceLogic.new.execute(params) }.to change { CreationPiece.count }.by(1)
      end
    end
  end # execute
end
