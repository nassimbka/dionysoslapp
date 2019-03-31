import "bootstrap";

// const leftArrow = document.querySelector('.arrow-left')
// const ResultEvent = document.querySelector('.primary-result')

// leftArrow.addEventListener(("click"),(event)=> {
//   ResultEvent.innerHTML = "<div class='photo-result'><%= image_tag @events.second.photo_url %></div><div class='text-result'><h1><%= @events.second.name %></h1><h2><%= @events.second.category %> <%= @events.second.venue.name %></h2><h3>Film -<%= @events.second.tags.second.name.capitalize %></h3><%= link_to 'Voir les détails', event_path(@events.second) %></div>"
// });

$('.carousel').carousel({
  interval: false
})
