module UsersHelper
    def get_picture(user, classes, size)
        url = "https://secure.gravatar.com/avatar/#{Digest::MD5::hexdigest(user.email.downcase)}?d=identicon"
        if user.picture
            url = user.picture
        end
        image_tag(url, alt: user.full_name, class: classes, width: size)
    end
end
