---
layout: page
title: Process
permalink: /process/
---

# Process

## Team

Our team utilized weekly meetings on Tuesdays, paired programming or breakout sessions where necessary, and a [Trello project board](https://trello.com/b/7bAUsPY6/sana-project-board) to manage our tasks and process.

Adam did a varied stack of work, managing our deployment and CI/CD with Heroku and Codeship respectively, setting up our initial UI and CRUD operations, implementing our initial Figma wireframe, and worked with many of our external gems and libraries for our features. He was responsible for our real-time notifications, alerts and tooltips, matching & messaging, and native & SSO authentication.

Sarah did a varied stack of work, being the primary maintainee and implementer of our testing suite, developing our profile views and organization system, and implementing critical sections of our match backend logic.

Nicole focused on a lot of front-end and design work, designing our logo, design typography and final UI, co-developing our paper prototype, implementing our home and about pages, implementing search and filtering functionality, and incorporating our category system.

Aaron worked on mostly back-end development, implementing CRUD operations for posting and replying, enabling mailing capability for password reset, building a lot of our forms, and implementing reactions.

## Development

Our application was conceptualized as a blending of ideas in creating communities for those living with illnesses and a forum to connect those who can provide for or are requesting help with specific needs.

Our conceptualization started with [paper prototypes](https://github.com/SanaTeam/sana/blob/main/public/paper_prototypes.pdf) and continued with [interactive Figma wireframes](https://www.figma.com/proto/mFxItAbMhLuY8SrB0KFrXL/Wireframe?node-id=4%3A301&scaling=min-zoom), with our UI blending as a combination of the two.

## Deployment & Testing

We utilized minitest to test our models for valid and invalid cases and test routes and critical functionality, developing helpers to assist in testing more complex flows. 

We adhere to continuous integration and continuous deployment practices. Initially automatically deploying to Heroku on every push to the main branch, we further optimized by connecting with CodeShip, so now upon every push to the main branch, CodeShip runs our test suite in its environment, and if it passes, it then deploys our application to production on Heroku.

[![Codeship Status for SanaTeam/sana](https://app.codeship.com/projects/f5b8ec28-e505-4bd2-8ceb-270ae746f985/status?branch=main)](https://app.codeship.com/projects/443139)