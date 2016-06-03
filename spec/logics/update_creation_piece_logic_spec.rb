# coding: utf-8
require 'rails_helper'

describe UpdateCreationPieceLogic, type: :logic do
  before do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, site: site, id: 900_000_001)
    creation = create(:creation, id: 900_000_001, site: site, site_user: site_user)
    create(:creation_piece, id: 900_000_001, creation: creation)
  end

  describe 'authorize' do
    context 'if Site does not exist,' do
      let(:params) do
        {
          site_id: 900_000_002,
          creation_piece: attributes_for(:creation_piece, id: 900_000_001)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = UpdateCreationPieceLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:errors][:site].count).to eq 1
      end
    end
  end # authorize

  describe 'validate' do
    context '型チェックエラー' do
      let(:params) do
        {
          site_id: 900_000_001,
          creation_piece: attributes_for(:creation_piece,
                                         id: 900_000_001,
                                         name: 'A' * 201,
                                         file_name_for_user: 'A' * 257,
                                         image_name_for_user: 'A' * 257
                                        )
        }
      end

      it 'returns error' do
        #
        # exectue
        #
        result = UpdateCreationPieceLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:image_name_for_user].count).to eq 1
      end
    end

    context '論理チェックエラー' do
      before do
        create(:site, id: 900_000_002)
        create(:creation_piece, id: 900_000_002)
      end

      let(:params) do
        {
          site_id: 900_000_002,
          creation_piece: attributes_for(:creation_piece, id: 900_000_002)
        }
      end

      it 'returns error' do
        #
        # exectue
        #
        result = UpdateCreationPieceLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:creation].count).to eq 1
      end
    end
  end # validate

  describe '#execute' do
    context 'normal condition' do
      let(:params) do
        {
          site_id: 900_000_001,
          creation_piece: { id: 900_000_001,
                            name: 'updated name',
                            file_name_for_user: 'updated.jpg',
                            image_name_for_user: 'updated.jpg'
                          }
        }
      end

      it 'update a Creation' do
        #
        # execute
        #
        result = UpdateCreationPieceLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:creation_piece].name).to eq params[:creation_piece][:name]
        expect(result[:creation_piece].file_name_for_user).to eq params[:creation_piece][:file_name_for_user]
        expect(result[:creation_piece].image_name_for_user).to eq params[:creation_piece][:image_name_for_user]
      end
    end
  end # execute
end
