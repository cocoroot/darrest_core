# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'factory_girl'
#Dir[Rails.root.join('spec/factories/*.rb')].each {|f| puts f; require f }

# delete all data
Core::Category.delete_all
Core::Collection.delete_all
Core::CollectionCreation.delete_all
Core::Creation.delete_all
Core::CreationCategory.delete_all
Core::CreationComment.delete_all
Core::CreationImage.delete_all
Core::CreationTag.delete_all
Core::Creator.delete_all
Core::CreatorCategory.delete_all
Core::CreatorImage.delete_all
Core::CreatorTag.delete_all
Core::Good.delete_all
Core::Piece.delete_all
Core::Report.delete_all
Core::ReportImage.delete_all
Core::Tag.delete_all
Core::User.delete_all
Core::UserImage.delete_all

# User
user_a = FactoryGirl.create(:core_user)
user_b = FactoryGirl.create(:core_user)
user_c = FactoryGirl.create(:core_user)

# User Image
FactoryGirl.create(:core_user_image, user: user_a, in_use: true)
FactoryGirl.create(:core_user_image, user: user_b, in_use: true)
FactoryGirl.create(:core_user_image, user: user_b, in_use: false)
FactoryGirl.create(:core_user_image, user: user_c, in_use: false)

# Creator
creator_a1 = FactoryGirl.create(:core_creator, user: user_a)
creator_b1 = FactoryGirl.create(:core_creator, user: user_b)
creator_b2 = FactoryGirl.create(:core_creator, user: user_b)
creator_c1 = FactoryGirl.create(:core_creator, user: user_c)
creator_c2 = FactoryGirl.create(:core_creator, user: user_c)
creator_c3 = FactoryGirl.create(:core_creator, user: user_c)

# Creator Image
FactoryGirl.create(:core_creator_image, creator: creator_a1, in_use: true)
FactoryGirl.create(:core_creator_image, creator: creator_a1, in_use: true)
FactoryGirl.create(:core_creator_image, creator: creator_b1, in_use: true)
FactoryGirl.create(:core_creator_image, creator: creator_b2, in_use: false)
FactoryGirl.create(:core_creator_image, creator: creator_c1, in_use: false)
FactoryGirl.create(:core_creator_image, creator: creator_c2, in_use: false)
FactoryGirl.create(:core_creator_image, creator: creator_c3, in_use: false)

# Category Master
category_a = FactoryGirl.create(:core_category, name: 'カテゴリーＡ')
category_b = FactoryGirl.create(:core_category, name: 'カテゴリーＢ')
category_b1 = FactoryGirl.create(:core_category, name: 'カテゴリーＢ－１', parent: category_b)
category_b2 = FactoryGirl.create(:core_category, name: 'カテゴリーＢ－２', parent: category_b)
category_c1 = FactoryGirl.create(:core_category, name: 'カテゴリーＣ－１')
category_c2 = FactoryGirl.create(:core_category, name: 'カテゴリーＣ－２')

# Tag Master
tag_alpha = FactoryGirl.create(:core_tag, name: 'タグα')
tag_beta = FactoryGirl.create(:core_tag, name: 'タグβ')
tag_gamma = FactoryGirl.create(:core_tag, name: 'タグγ')
tag_delta = FactoryGirl.create(:core_tag, name: 'タグδ')

# Creator-Category
FactoryGirl.create(:core_creator_category, creator: creator_a1, category: category_a)
FactoryGirl.create(:core_creator_category, creator: creator_b1, category: category_b1)
FactoryGirl.create(:core_creator_category, creator: creator_b2, category: category_b2)
# creator c1,c2,c3 belongs to no category

# Creator-Tag
FactoryGirl.create(:core_creator_tag, creator: creator_a1, tag: tag_alpha)
FactoryGirl.create(:core_creator_tag, creator: creator_b1, tag: tag_beta)
FactoryGirl.create(:core_creator_tag, creator: creator_b2, tag: tag_gamma)
# creator c1,c2,c3 have no tag

# Creation
creation_a1_1 = FactoryGirl.create(:core_creation, creator: creator_a1)
creation_b1_1 = FactoryGirl.create(:core_creation, creator: creator_b1)
creation_b1_2 = FactoryGirl.create(:core_creation, creator: creator_b1)
creation_b2_1 = FactoryGirl.create(:core_creation, creator: creator_b2)
creation_c1_1 = FactoryGirl.create(:core_creation, creator: creator_c1)
creation_c2_1 = FactoryGirl.create(:core_creation, creator: creator_c2)

# Creation Image
FactoryGirl.create(:core_creation_image, creation: creation_a1_1)
FactoryGirl.create(:core_creation_image, creation: creation_b1_1)
FactoryGirl.create(:core_creation_image, creation: creation_b1_1)
FactoryGirl.create(:core_creation_image, creation: creation_b1_2)
FactoryGirl.create(:core_creation_image, creation: creation_b2_1)
FactoryGirl.create(:core_creation_image, creation: creation_c1_1)
# c2_1 has no image

# Creation-Category
FactoryGirl.create(:core_creation_category, creation: creation_a1_1, category: category_a)
FactoryGirl.create(:core_creation_category, creation: creation_b1_1, category: category_b1)
FactoryGirl.create(:core_creation_category, creation: creation_b1_2, category: category_b1)
FactoryGirl.create(:core_creation_category, creation: creation_b2_1, category: category_b2)
FactoryGirl.create(:core_creation_category, creation: creation_c1_1, category: category_c1)
FactoryGirl.create(:core_creation_category, creation: creation_c2_1, category: category_c2)

# Creation-Tag
FactoryGirl.create(:core_creation_tag, creation: creation_a1_1, tag: tag_alpha)
FactoryGirl.create(:core_creation_tag, creation: creation_b1_1, tag: tag_beta)
FactoryGirl.create(:core_creation_tag, creation: creation_b1_1, tag: tag_gamma)
FactoryGirl.create(:core_creation_tag, creation: creation_b1_2, tag: tag_beta)
FactoryGirl.create(:core_creation_tag, creation: creation_b2_1, tag: tag_beta)
# c1_1,2_1 has no tag

# Piece
piece_a_1_p1 = FactoryGirl.create(:core_piece, creation: creation_a1_1)
piece_b1_1_p1 = FactoryGirl.create(:core_piece, creation: creation_b1_1)
piece_b1_1_p2 = FactoryGirl.create(:core_piece, creation: creation_b1_1)
piece_b1_2_p1 = FactoryGirl.create(:core_piece, creation: creation_b1_2)
piece_b2_1_p1 = FactoryGirl.create(:core_piece, creation: creation_b2_1)
piece_c1_1_p1 = FactoryGirl.create(:core_piece, creation: creation_c1_1)
piece_c1_2_p1 = FactoryGirl.create(:core_piece, creation: creation_c2_1)

# CreationComment
comment_to_a1_1 = FactoryGirl.create(:core_creation_comment, creation: creation_a1_1, user: user_a)
comment_to_b1_1 = FactoryGirl.create(:core_creation_comment, creation: creation_b1_1, user: user_b)
comment_to_b1_1 = FactoryGirl.create(:core_creation_comment, creation: creation_b1_1, user: user_b, parent: comment_to_b1_1)
comment_to_b1_2 = FactoryGirl.create(:core_creation_comment, creation: creation_b1_2, user: user_a)
comment_to_b2_1 = FactoryGirl.create(:core_creation_comment, creation: creation_b2_1, user: user_c)

# Collection
collection_a_1 = FactoryGirl.create(:core_collection, user: user_a)
collection_b_1 = FactoryGirl.create(:core_collection, user: user_b)
collection_b_2 = FactoryGirl.create(:core_collection, user: user_b)

# Collection-Creation
FactoryGirl.create(:core_collection_creation, collection: collection_a_1, creation: creation_a1_1)
FactoryGirl.create(:core_collection_creation, collection: collection_b_1, creation: creation_b1_1)
FactoryGirl.create(:core_collection_creation, collection: collection_b_1, creation: creation_b1_2)
FactoryGirl.create(:core_collection_creation, collection: collection_b_2, creation: creation_a1_1)
FactoryGirl.create(:core_collection_creation, collection: collection_b_2, creation: creation_b1_1)
FactoryGirl.create(:core_collection_creation, collection: collection_b_2, creation: creation_b1_2)
FactoryGirl.create(:core_collection_creation, collection: collection_b_2, creation: creation_c1_1)

# Good
FactoryGirl.create(:core_good, creation: creation_a1_1, user: user_b)
FactoryGirl.create(:core_good, creation: creation_b1_1, user: user_a)
FactoryGirl.create(:core_good, creation: creation_b1_1, user: user_b)
FactoryGirl.create(:core_good, creation: creation_b1_2, user: user_a)
FactoryGirl.create(:core_good, creation: creation_b1_2, user: user_b)
FactoryGirl.create(:core_good, creation: creation_b1_2, user: user_c)

# Report
report_from_b_about_a_1  = FactoryGirl.create(:core_report, creation: creation_a1_1, user: user_b)
report_from_a_about_b1_1 = FactoryGirl.create(:core_report, creation: creation_b1_1, user: user_a)
report_from_c_about_b1_1 = FactoryGirl.create(:core_report, creation: creation_b1_1, user: user_c)

# Report-Image
FactoryGirl.create(:core_report_image, report: report_from_b_about_a_1)
FactoryGirl.create(:core_report_image, report: report_from_a_about_b1_1)
FactoryGirl.create(:core_report_image, report: report_from_a_about_b1_1)
# no image on report_from_c
