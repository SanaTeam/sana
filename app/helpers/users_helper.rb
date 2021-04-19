module UsersHelper
    def get_gravatar(user, classes, size)
        image_tag("https://secure.gravatar.com/avatar/#{Digest::MD5::hexdigest(user.email.downcase)}", alt: user.full_name, class: classes, width: size)
    end
end
