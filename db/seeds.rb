User.delete_all
Organization.delete_all
Post.delete_all
Reply.delete_all

def parse_json(file)
    JSON.parse(File.read(Rails.public_path.join(file)))
end

# User model fields
# first_name:string last_name:string email:string password:string
15.times do
    user_first = Faker::Name.first_name
    user_last = Faker::Name.last_name
    user_email = Faker::Internet.email(name: user_first)
    user_password = Faker::Internet.password(min_length: 8, max_length: 14)
    User.create(first_name: user_first, last_name: user_last, email: user_email, password: user_password)
end 

# Organization model fields 
# name:string org_type:integer accepts_donations:boolean location:string
15.times do 
    org_name = Faker::Company.name
    type_org = Faker::Company.industry
    org_accepts_don = Faker::Boolean.boolean 
    org_location = Faker::Address.city 
    Organization.create(name: org_name, org_type: type_org, accepts_donations: org_accepts_don, location: org_location)
end 

# Post model fields
# title:string content:string user_id:integer pinned:boolean is_anonymous:boolean

# Reply model fields
# content:string to:integer user_id:integer post_id:integer

posts_json = parse_json("posts.json")
replies_json = parse_json("replies.json")

posts_json.each do |post_json|
    post_title = post_json['title']
    post_content = post_json['content']
    post_categories = post_json['categories']
    post_pinned = Faker::Boolean.boolean
    post_anon = Faker::Boolean.boolean(true_ratio: 0.5)
    post_isrequest = Faker::Boolean.boolean(true_ratio: 0.5)
    post = Post.new(title: post_title, content: post_content, user_id: User.all.sample.id, pinned: post_pinned, is_anonymous: post_anon, categories: post_categories, is_request: post_isrequest)
    post.save

    rand(0..3).times do 
        reply_cont = replies_json.sample
        Reply.create(content: reply_cont, to: User.all.sample.id, user_id: User.all.sample.id, post_id: post.id)
    end 
end 


