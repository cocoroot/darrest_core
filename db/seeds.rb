# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'factory_girl'
# Dir[Rails.root.join('spec/factories/*.rb')].each {|f| puts f; require f }

SiteUserImage.destroy_all
CreationImage.destroy_all
CreationPiece.destroy_all
DatabaseCleaner.clean_with :truncation

include FactoryGirl::Syntax::Methods

# Load Master Data
require "#{Rails.root.join('db/seeds/master.rb')}"

# Site
site01 = create(:site)
create(:site)

# User
user01 = create(:user, baas_id: '5422fb650500-2b2b-6e11-8802-0816b8d4')
user02 = create(:user, baas_id: '5339fb650500-cccb-6e11-9802-0518e7a0')
user03 = create(:user, baas_id: '5422fb650500-2b2b-6e11-9802-057e6981')
create(:user)

# SiteUser
site_user01 = create(:site_user, site: site01, user: user01)
site_user02 = create(:site_user, site: site01, user: user02)
site_user03 = create(:site_user, site: site01, user: user03)
create(:site_user)

# SiteUserImage
create(:site_user_image, site_user: site_user01)
create(:site_user_image, site_user: site_user01)
create(:site_user_image, site_user: site_user02)
create(:site_user_image, site_user: site_user03)
create(:site_user_image)

# SiteUserHeaderImage
3.times { create(:site_user_header_image, site_user: site_user01) }
create(:site_user_header_image, site_user: site_user02)
create(:site_user_header_image, site_user: site_user03)
create(:site_user_header_image)

# Tag
tag01 = create(:tag, site: site01)
tag02 = create(:tag, site: site01)
tag03 = create(:tag, site: site01)
tag04 = create(:tag, site: site01, tag_class: TagClass::MANAGERS)
create(:tag)

# SiteUseTag
# create(:site_user_tag, site_user: site_user01, tag: tag01)
# create(:site_user_tag, site_user: site_user01, tag: tag02)
# create(:site_user_tag, site_user: site_user01, tag: tag03)
# create(:site_user_tag, site_user: site_user01, tag: tag04)
# create(:site_user_tag)

# Creation
creation_01 = create(:creation, site: site01, site_user: site_user01)
creation_02 = create(:creation, site: site01, site_user: site_user01)
5.times { create(:creation, site: site01) }
create(:creation)

# CreationImage
2.times { create(:creation_image, creation: creation_01) }
5.times { create(:creation_image, creation: creation_02) }
create(:creation_image)

# CreationPiece
2.times { create(:creation_piece, creation: creation_01) }
5.times { create(:creation_piece, creation: creation_02) }
create(:creation_piece)

# CreationTag
create(:creation_tag, creation: creation_01, tag: tag01)
create(:creation_tag, creation: creation_01, tag: tag02)
create(:creation_tag, creation: creation_01, tag: tag03)
create(:creation_tag, creation: creation_01, tag: tag04)
create(:creation_tag)

# CreationComment
3.times { create(:creation_comment, creation: creation_01, site_user: site_user02) }
3.times { create(:creation_comment, creation: creation_01, site_user: site_user03) }
create(:creation_comment)

# Good
create(:good, creation: creation_01, site_user: site_user02)
create(:good, creation: creation_01, site_user: site_user03)
create(:good)
