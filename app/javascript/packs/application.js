// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// import "css/style";
import $ from "jquery";
import "select2";
global.$ = jQuery;


import "pdfmake";

global.toastr = require("toastr");

window.addEventListener("DOMContentLoaded", () => {
  $(".select2").select2({
    width: "100%"
  });
});
import "bootstrap";
import "summernote";
import flatpickr from "flatpickr";

document.addEventListener("turbolinks:load", () => {
  flatpickr("[data-behavior='flatpickr']", {
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
  });
  $('.summernote').summernote();


});



require("packs/app-style-switcher");

// require("packs/feather.min");
require("packs/perfect-scrollbar.jquery.min");
require("packs/sidebarmenu");

const feather = require("feather-icons");
document.addEventListener("turbolinks:load", function () {
  feather.replace();
});




// import css
import "select2/dist/css/select2.css";
import "css/application";

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require.context("../images", true);
  