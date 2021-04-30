module NewOrganizationHelper
    def new_organization(org_name)
        post organizations_path, params: { 
            organization: {
                name: org_name,
                org_type: rand(1...10),
                accepts_donations: [true, false].sample,
                location: Faker::Address.street_address
            }  
        }
    end
end
