import "bootstrap";

// const leftArrow = document.querySelector('.arrow-left')
// const ResultEvent = document.querySelector('.primary-result')

// leftArrow.addEventListener(("click"),(event)=> {
//   ResultEvent.innerHTML = "<div class='photo-result'><%= image_tag @events.second.photo_url %></div><div class='text-result'><h1><%= @events.second.name %></h1><h2><%= @events.second.category %> <%= @events.second.venue.name %></h2><h3>Film -<%= @events.second.tags.second.name.capitalize %></h3><%= link_to 'Voir les détails', event_path(@events.second) %></div>"
// });

$('.carousel').carousel({
  interval: false
})

const UlAnswerLoading = document.querySelectorAll('#ul-answer-loading li');
const tagLineLoading = document.querySelector('.tagline-index-loading')
const impatientGif = document.querySelector('.impatient-gif');
const tagLineEndLoading = document.getElementById('tagline-end-loading')
const resultWrapper = document.querySelector('.wrapper-index')
const linkResult = document.querySelector('.link-to-events')

const loadingWrapper = document.querySelector('.wrapper-loading')

if (loadingWrapper) {
  showLoadingAnimation()
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
};


function showLoadingAnimation() {

  if (loadingWrapper.dataset.skipSearch == "false") {

    UlAnswerLoading.forEach((li, index) => {
      sleep(index * 1000).then(() => {
        li.classList.replace('hide', 'display')
      });
    });




    sleep(UlAnswerLoading.length * 1050).then(() => {
      tagLineLoading.classList.add('hide')
      impatientGif.classList.add('hide')
      tagLineEndLoading.classList.remove('hide')
      linkResult.classList.remove('hide')
      linkResult.addEventListener(('click'),(event)=>{
        event.preventDefault();
        tagLineEndLoading.classList.add('hide')
        UlAnswerLoading.forEach((li, index) => {
          li.classList.replace('display', 'hide')
        });
        loadingWrapper.classList.add('hide')
        resultWrapper.classList.remove('hide')
      })
    })
  } else {
    loadingWrapper.classList.add('hide')
    resultWrapper.classList.remove('hide')
  }
}

// if (params[:action] === "index") {
  // showLoadingAnimation()
// }


const result1 = document.querySelector('.result1');
const result2 = document.querySelector('.result2');
const result3 = document.querySelector('.result3');

const arrayOfResult = [result1, result2, result3];

const leftArrow = document.querySelector('.left-arrow');
const rightArrow = document.querySelector('.right-arrow');

let slideIndex = 0

// if (result1) {
// }

// function carousselHomeMade() {
if (rightArrow) {
  showSlides(slideIndex);
  leftArrow.addEventListener(("click"), (event)=> {
    plusSlides(-1);
  })

  rightArrow.addEventListener(("click"), (event)=> {
    plusSlides(1);
  })
}


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

const phoneNumberForm = document.querySelector('.phone-number')
const btnTwilio = document.querySelector('.btn-twilio')

if (btnTwilio) {

  btnTwilio.addEventListener(("click"), (event) => {
    event.preventDefault();
    phoneNumberForm.classList.remove("hide");
    actionMailerForm.classList.add('hide')
  });

  const sendBtn = document.querySelector('.send')
  const msgSendEffectued = document.querySelector('.send-effectued-texto')

  sendBtn.addEventListener(('click'), (event) => {
    msgSendEffectued.innerHTML = '<p style="color: green; font-size: 20px;">Ton sms a bien été envoyé !</p>'
    phoneNumberForm.classList.add('hide');
  })
}

// LE JS DU MAILER FORM
const actionMailerForm = document.querySelector('.email')
const btnActionMailer = document.querySelector('.btn-email') // btn-actionMailer?

if (btnActionMailer) {

  btnActionMailer.addEventListener(("click"), (event) => {
    event.preventDefault();
    actionMailerForm.classList.remove("hide");
    phoneNumberForm.classList.add('hide');
  });

  const sendBtn = document.querySelector('.send2')
  const msgSendEffectued = document.querySelector('.send-effectued-mail')

  sendBtn.addEventListener(('click'), (event) => {
    msgSendEffectued.innerHTML = '<p style="color: green; font-size: 20px;">Ton mail a bien été envoyé !</p>'
    phoneNumberForm.classList.add('hide');
  })
}
