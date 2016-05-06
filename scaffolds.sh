cd /Users/d318503/Developer/DigitalFabricationPlatform/darrest_core/

bin/rails g scaffold_controller manage/Category name:string parent_id:integer
bin/rails g scaffold_controller manage/Collection sid:string user:references title:text
bin/rails g scaffold_controller manage/CollectionCreation collection:references creation:references
bin/rails g scaffold_controller manage/Creation sid:string creator:references title:string description:text license_code:string
bin/rails g scaffold_controller manage/CreationCategory creation:references category:references
bin/rails g scaffold_controller manage/CreationComment sid:string creation:references user:references parent_id:integer notice_code:string
bin/rails g scaffold_controller manage/CreationImage creation:references image:string
bin/rails g scaffold_controller manage/CreationTag creation:references references:Tag
bin/rails g scaffold_controller manage/Creator sid:string user:references name:string text:description
bin/rails g scaffold_controller manage/CreatorCategory creator:references category:references
bin/rails g scaffold_controller manage/CreatorImage creator:references image:string boolean:in_use
bin/rails g scaffold_controller manage/CreatorTag creator:references tag:references
bin/rails g scaffold_controller manage/Good creation:references user:references
bin/rails g scaffold_controller manage/Piece creation:references name:string description:text file_name:text format:string image:string
bin/rails g scaffold_controller manage/Report creation:references user:references title:string detail:text
bin/rails g scaffold_controller manage/ReportImage report:references image:string
bin/rails g scaffold_controller manage/Tag name:string
bin/rails g scaffold_controller manage/User baas_id:string
bin/rails g scaffold_controller manage/UserImage user:references image:string in_use:boolean
