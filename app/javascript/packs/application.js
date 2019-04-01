import "bootstrap";

// const leftArrow = document.querySelector('.arrow-left')
// const ResultEvent = document.querySelector('.primary-result')

// leftArrow.addEventListener(("click"),(event)=> {
//   ResultEvent.innerHTML = "<div class='photo-result'><%= image_tag @events.second.photo_url %></div><div class='text-result'><h1><%= @events.second.name %></h1><h2><%= @events.second.category %> <%= @events.second.venue.name %></h2><h3>Film -<%= @events.second.tags.second.name.capitalize %></h3><%= link_to 'Voir les détails', event_path(@events.second) %></div>"
// });

$('.carousel').carousel({
  interval: false
})

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
};

const UlAnswerLoading = document.querySelectorAll('#ul-answer-loading li');

UlAnswerLoading.forEach((li, index) => {
  sleep(index * 1500).then(() => {
    li.classList.replace('hide', 'display')
  });
});


const tagLineLoading = document.querySelector('.tagline-index-loading')
const impatientGif = document.querySelector('.impatient-gif');
const tagLineEndLoading = document.getElementById('tagline-end-loading')
const loadingWrapper = document.querySelector('.wrapper-loading')
const resultWrapper = document.querySelector('.wrapper-index')


sleep(UlAnswerLoading.length * 1550).then(() => {
  tagLineLoading.classList.add('hide')
  impatientGif.classList.add('hide')
  tagLineEndLoading.classList.remove('hide')

  sleep(2500).then(() => {
    tagLineEndLoading.classList.add('hide')
    UlAnswerLoading.forEach((li, index) => {
      li.classList.replace('display', 'hide')
    });
    loadingWrapper.classList.add('hide')
    resultWrapper.classList.remove('hide')
  })
})
