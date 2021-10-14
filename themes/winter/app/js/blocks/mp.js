// mp.js

//--------- jQuery: plugins section after full DOM load ----------
$(document).ready(function () {
  //--------- jQuery: magnific-popup-gallery  ----------
  const titleText = `<p>Made with <span style="color: #e60f0a;">&#10084;</span> of monumental architecture.</p>`
  const titleError = '<a href="%url%">Изображение #%curr%</a> загрузить нельзя.'

  $('.popup-gallery').magnificPopup({
    delegate: 'a',
    type: 'image',
    tLoading: 'Loading image #%curr%...',
    mainClass: 'mfp-img-mobile',
    gallery: {
      enabled: true,
      navigateByImgClick: true,
      preload: [0, 1], // Will preload 0 - before current, and 1 after the current image
    },
    image: {
      tError: titleError,
      titleSrc: function (item) {
        return item.el.attr('title') + titleText
      },
    },
  })

  //--------- jQuery: magnific-popup single image view --------
  $('.link-popup').magnificPopup({
    type: 'image',
    image: {
      tError: titleError,
      titleSrc: function (item) {
        return item.el.attr('title') + titleText
      },
    },
    // other options
  })

  //--------- jQuery: magnific-popup viewing content of different types ---------
  $('#open-popup').magnificPopup({
    items: [
      {
        src: '/themes/winter/assets/images/b3.jpg',
        title: 'Made with <span style="color: #e60f0a;">&#10084;</span> for the best architecture.',
      },
      {
        src: 'https://vimeo.com/video/141995089',
        type: 'iframe', // this overrides default type
      },
      {
        src: $('<div class="white-popup">Dynamically created element</div>'), // Dynamically created element
        type: 'inline',
      },
      {
        src: '<div class="white-popup">Popup from HTML string</div>', // HTML string
        type: 'inline',
      },
      {
        src: '#popup', // CSS selector of an element on page that should be used as a popup
        type: 'inline',
      },
    ],
    gallery: {
      enabled: true,
    },
    type: 'image', // this is a default type
  })

  // -------- jQuery: add-remove class ------------

  // $(".view-img").hover(function () {
  //   $(this).toggleClass("shadow");
  // });
})
//--- end: jQuery: plugins section after full DOM load ---
