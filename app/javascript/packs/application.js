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


const result1 = document.querySelector('.result1');
const result2 = document.querySelector('.result2');
const result3 = document.querySelector('.result3');

const arrayOfResult = [result1, result2, result3];

const leftArrow = document.querySelector('.left-arrow');
const rightArrow = document.querySelector('.right-arrow');

let slideIndex = 0
showSlides(slideIndex);

leftArrow.addEventListener(("click"), (event)=> {
  plusSlides(-1);
})

rightArrow.addEventListener(("click"), (event)=> {
  plusSlides(1);
})


function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = arrayOfResult;
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].classList.add('hide');
  }
  slides[slideIndex-1].classList.remove('hide');
}
