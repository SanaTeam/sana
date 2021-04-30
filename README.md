<img src="https://raw.githubusercontent.com/SanaTeam/sana/main/public/logo.svg" width="100" height="100">

# Sana
Sana comes from the verb sanar in Spanish, which means healing. We firmly believe that serving our communities has healing powers on an individual and collective level. Our app will enable people to contribute with their skills and expertise to fulfill the needs of their community. 

Sana is a platform where users can create profiles and match with people based on what their needs are and what they can provide. Users can authenticate, and once signed in, post to the forum about services they can offer or a need they have. Users can respond to posts, and if interested in connecting, request a match with the creator of the post. On the user profile, users can accept pending matches, navigate to their matches, and view their message/post history. Within matches, users can interact directly on their mutual focus. Further useful features include searching and filtering by categories, real-time response refreshing and notifications, a swipe-like view to also look for potential need matches to meet, and organization profiles to be delegated to users, among others. 

Builds on the main branch are validated against our test suite via CodeShip and deployed to Heroku automatically upon passing.

[![Codeship Status for SanaTeam/sana](https://app.codeship.com/projects/f5b8ec28-e505-4bd2-8ceb-270ae746f985/status?branch=main)](https://app.codeship.com/projects/443139)

[Heroku link](http://sana-app.herokuapp.com/)

[Paper prototype](https://github.com/SanaTeam/sana/blob/main/public/paper_prototypes.pdf)

[Figma interactive wireframe](https://www.figma.com/proto/mFxItAbMhLuY8SrB0KFrXL/Wireframe?node-id=4%3A301&scaling=min-zoom)

## APIs/gems/libraries
* Bootstrap, JQuery and Popper for UI & alerts
* FontAwesome-Rails for our icon typography
* Kaminari for pagination of post and user views
* RailsAdmin for an admin view for admin users to manipulate models
* Stimulus, Hammer.js, and Animate.css for match swiping view
* Redis, StimulusReflex & CableReady for real-time notifications of replies and matches you're involved in
* Auth0 for Google and Facebook OAuth alternative login
* Searchkick and Elasticsearch for searching post and user models

## Architecture
Post
* Belongs_to User
* Has_many Replies
* content - string, the body of a post
* user_id - integer, the id of the posting user
* pinned - boolean, whether a post has been pinned to the top of the forum
* is_anonymous - boolean, whether a post is written anonymously
* title - string, the title of a post
  
User
* Has_many Posts, Organizations, Messages
* first_name - string, the first name of a user
* last_name - string, the last name of a user
* email - string, the email of a user
* password_digest - string, the BCrypt digested password of a user
  
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


## URL Scheme
Implemented URL paths:

* Homepage page: /
* Users urls: /users/new
* Forum of posts: /posts, /posts/new, /posts/:id, /posts/edit, /posts?page=2 
* Display post creation to request/offer help: /posts/new? 
* Display user profile: /users/:id
* Display match confirmation and message thread related to a match: /matches/:id
* Display all messages: /users/:id/message
* Display user matches: /users/:id/matches
* Display user login prompt: /sessions/new
* Display user sign up page: /users/new
* Display user activity: /users/:id/activity

## Views
Implemented
* User Authentication View
  * Sign up
  * Log in
* Forum View
  * Displays all posts in the database (as of now) using pagination
  * Button to create a post to the forum
  * Button to view a post in the forum
  * Button to edit/delete a post from the forum if you had created it
  * Buttons to move between pages
* User View 
  * Displays user’s first name, last name, and email
  * If you’re viewing your own profile
    * Base profile view has three buttons, two of which are currently enabled
      * Request help, which creates a post
      * Offer help, which creates a post
    * Sidemenu with three links
      * Messages
        * Displays the first name of each of the people you’ve matched with
        * Displays a show button so you can view all of your messages and message them further
      * Activity
        * Displays all of the posts that you’ve created
        * Button to show post
        * Button to edit post
        * Button to delete post
* Matches
  * Displays all of your matches, ones that you have yet to accept, and one’s that you have both confirmed
  * On matches you have yet to accept…
    * Button to accept match
    * Button to deny match
  * On matches you have already accepted…
    * Button to show match
* Post Create View
  * Input for title
  * Input for content
  * Checkbox for pinned
  * Checkbox for is anonymous
  * Button to save post to forum
* Post Show View
  * Displays post title, content, creator, datetime
  * Button to edit
  * Button to delete
  * Displays all replies to the post
  * Input box and Send button at the bottom to send a new message
  * Button to request a match with the creator of the post
  * Button to return to forum
* Post Edit View
  * Same as post create view, but the content of the title and content inputs is filled in based on the existing post’s fields
* Match/Message Show View
  * Displays all of the messages between you and the other person involved in the match
  * Each individual message displays the sender’s first name, the content of the message, and a button to delete the message
  * Input box and Save button at the bottom to send a new message
* Views to create, edit, and show an organization
* View to browse for matches
* View to search for a user
* View to see any notifications
* View to see your organizations, that you follow, that you’re an admin of