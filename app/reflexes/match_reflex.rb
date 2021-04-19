# frozen_string_literal: true

class MatchReflex < ApplicationReflex
  def accept(postId, user1Id, user2Id)
    sleep 1
    Match.create(post_id: postId, user1_id: user1Id, user2_id: user2Id, user1_confirmed: true)
  end

  def decline(postId, user1Id, user2Id)
    sleep 1
    puts "#{postId} #{user1Id} #{user2Id} nay"
  end
end
