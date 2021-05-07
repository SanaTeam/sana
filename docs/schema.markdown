---
layout: page
title: Schema
permalink: /schema/
---
# Schema
Post
* Belongs_to User
* Has_many Replies
* content - string, the body of a post
* user_id - integer, the id of the posting user
* pinned - boolean, whether a post has been pinned to the top of the forum
* is_anonymous - boolean, whether a post is written anonymously
* title - string, the title of a post
* categories - string array, the categories pertaining to a post
* is_request - boolean, whether a post is asking for or offering help
* organization_id - integer, the id of a posting user's organization if applicable
  
User
* Has_many Posts, Organizations, Messages
* first_name - string, the first name of a user
* last_name - string, the last name of a user
* email - string, the email of a user
* password_digest - string, the BCrypt digested password of a user
* oauth_id - string, the returned unique identifier from Auth0 for Facebook or Google accounts if they don't use email
* picture - string, the url to an Auth0 user's profile picture if applicable
* admin - boolean, whether the user is an admin for Sana and can edit all models, pin posts, etc.
  
Match
* Has_many Messages
* post_id - integer, the id of the corresponding post if applicable
* user1_id - integer, the id of one of the users in the match
* user2_id - integer, the id of the other user in the match
* user1_confirmed - boolean, whether user1 confirmed the match
* user2_confirmed - boolean, whether user2 confirmed the match
  
Organization
* name - string, the name of an organization
* accepts_donations - boolean, whether an organization accepts donations
* location - string, where an organization is located

Message
* Belongs_to Match
* content - string, the body of a message
* user_id - integer, the id of a posting user
* match_id - integer, the id of the corresponding match
  
Reply
* Belongs_to Post
* content - string, the body of a reply
* to - integer, the id of a recipient user
* user_id - integer, the id of a posting user
* post_id - integer, the id of the corresponding post

Administrators
* user_id - integer, the id of the managing organization user
* organization_id - integer, the id of the managed organization