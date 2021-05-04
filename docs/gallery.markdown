---
layout: page
title: Screenshots & Architecture
permalink: /gallery/
---
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<style>
a {
    color: #2287aa !important;
    text-decoration: none;
}

h1 {
    font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif !important;
    font-weight: 300;
}
</style>

# Gallery

<div id="sana-carousel" class="carousel carousel-dark slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#sana-carousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#sana-carousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#sana-carousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#sana-carousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
    <button type="button" data-bs-target="#sana-carousel" data-bs-slide-to="4" aria-label="Slide 5"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/assets/architecture.png" class="d-block w-100" alt="Architecture diagram">
      <div class="carousel-caption d-none d-md-block">
        <h5>Architecture diagram</h5>
        <p>An overview of our CI/CD process and app architecture.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/assets/index.png" class="d-block w-100" alt="App homepage">
      <div class="carousel-caption d-none d-md-block">
        <h5>App homepage</h5>
        <p>What our app's interface and landing page looks like.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/assets/match.png" class="d-block w-100" alt="Match view">
      <div class="carousel-caption d-none d-md-block">
        <h5>Match view</h5>
        <p>Our app has an interactive swipe-able match view to connect with users with relevant needs/offerings.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/assets/notifs.png" class="d-block w-100" alt="Real-time notifications">
      <div class="carousel-caption d-none d-md-block">
        <h5>Real-time notifications</h5>
        <p>Recieve real-time notifications for threads and matches that you are involved in.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/assets/profile.png" class="d-block w-100" alt="Profile">
      <div class="carousel-caption d-none d-md-block">
        <h5>Profile</h5>
        <p>Access your profile to view your activity, accept matches, and more.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#sana-carousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#sana-carousel" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>