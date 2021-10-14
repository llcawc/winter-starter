// pswp.js
// open image

// document.addEventListener("DOMContentLoaded", () => {});

import PhotoSwipeLightbox from "photoswipe/dist/photoswipe-lightbox.esm.js";
import PhotoSwipe from "photoswipe/dist/photoswipe.esm.js";

// don't forget to include CSS in some way
// import 'photoswipe/dist/photoswipe.css';

const lightbox = new PhotoSwipeLightbox({
  gallerySelector: ".pswp-gallery",
  childSelector: "figure a",
  pswpModule: PhotoSwipe,
});
lightbox.init();

const onelightbox = new PhotoSwipeLightbox({
  gallerySelector: ".pswp-img a",
  pswpModule: PhotoSwipe,
});
onelightbox.init();
