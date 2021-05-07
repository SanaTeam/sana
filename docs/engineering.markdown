---
layout: page
title: Challenges
permalink: /challenges/
---

# Challenges

Each of us ran into various challenges over the course of development. A baseline challenge for all of us was ensuring that our various servers and databases of Redis, Postgres, and Elasticsearch were all running as they should be across our various environments as our app grew in complexity. This was particularly a challenge due to some of us being Mac users and others Windows users, having to utilize Windows Subsystem for Linux (WSL) to program in Ruby on Rails. A lot of workarounds and internal documentation to ensure that we are all able to stand up the various databases and servers ensued!

With regards to some of our features, we initially thought to implement our messaging system via Twilio's Chat API. However, they deprecated the portion we intended to use, thus we needed to build a similar messaging feature out on our own via Rails model and relation logic. It was also difficult to implement Elasticsearch and Searchkick in conjunction with each other to get filters working individually and together, coordinating development and production environments' instances. It took some trial and error to establish which gem should be used for which aspect of the search feature, also looking at Textacular and a few others before determining the efficacy of Searchkick. 

From a testing standpoint, we ran into some problems with simulating signing in with fixtures. It took a lot of experimentation before we realized that using fixture data for that simulation wasn’t the best way to go about it, instead in part developing helper classes.

Finally, along the way, we ran into some merge conflicts as we worked our schema and Gemfiles across multiple branches and weren’t always able to root out problems in one go, though we persisted and grew as developers from these experiences.