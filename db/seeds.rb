
User.delete_all
Organization.delete_all
Post.delete_all
Profile.delete_all
Message.delete_all

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

# Message model fields
# content:string to:integer from:integer
15.times do 
    message_cont = Faker::Quotes::Chiquito.term
    Message.create(content: message_cont, to: User.all.sample.id, from: User.all.sample.id)
end 

# Profile model fields 
# user_id:integer organization_id:integer description:string is_active:boolean
15.times do 
    prof_description = Faker::Job.title
    prof_active = Faker::Boolean.boolean
    Profile.create(user_id: User.all.sample.id, organization_id: Organization.all.sample.id, description: prof_description, is_active: prof_description)
end 

# Post model fields
# content:string user_id:integer pinned:boolean is_anonymous:boolean date:datetime
15.times do 
    post_content = Faker::GreekPhilosophers.quote
    post_pinned = Faker::Boolean.boolean
    post_anon = Faker::Boolean.boolean
    post_date = Faker::Date.between(from: '2019-09-23', to: '2021-03-02')
    Post.create(content: post_content, user_id: User.all.sample.id, pinned: post_pinned, is_anonymous: post_anon, date: post_date)
end 



