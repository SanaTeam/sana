User.delete_all
Organization.delete_all
Post.delete_all
Reply.delete_all

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
15.times do 
    post_title = Faker::GreekPhilosophers.name
    post_content = Faker::GreekPhilosophers.quote
    post_pinned = Faker::Boolean.boolean
    post_anon = Faker::Boolean.boolean
    post_categories = ["Financial Literacy", "Transportation", "Productivity", "Mindfulness", "Healthy Habits", "Other"].sample(2)
    Post.create(title: post_title, content: post_content, user_id: User.all.sample.id, pinned: post_pinned, is_anonymous: post_anon, categories: post_categories)
end 

# Reply model fields
# content:string to:integer user_id:integer post_id:integer
15.times do 
    reply_cont = Faker::Quotes::Chiquito.term
    Reply.create(content: reply_cont, to: User.all.sample.id, user_id: User.all.sample.id, post_id: Post.all.sample.id)
end 


