require 'factory_girl'

include FactoryGirl::Syntax::Methods

# Create Master Data
puts 'Creating Master Data...'

con = ActiveRecord::Base.connection

SiteUserStatus.all.each do |status|
  q = "INSERT INTO site_user_statuses(id, name) VALUES(#{status.id}, '#{status.name}')"
  puts q
  con.execute(q)
end

CreationStatus.all.each do |status|
  q = "INSERT INTO creation_statuses(id, name) VALUES(#{status.id}, '#{status.name}')"
  puts q
  con.execute(q)
end

TagClass.all.each do |clazz|
  q = "INSERT INTO tag_classes(id, name) VALUES(#{clazz.id}, '#{clazz.name}')"
  puts q
  con.execute(q)
end
