// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

//= require_tree .
//= require i18n
//= require i18n.js
//= require i18n/translations

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "jquery";
import {} from 'jquery-ujs';
import AOS from 'aos';
import 'aos/dist/aos.css';
import { loadDynamicBannerText } from '../components/banner';
import { initMapbox } from '../plugins/init_mapbox';
import { calendarPat } from '../plugins/calendar';
import { calendarPatTwo } from '../plugins/calendar';
import { flatpickrDisplay } from  "../plugins/flatpickr";
import { sweetAlertNOK, alertNewBooking, sweetAlertDanger, sweetAlertMessage} from '../plugins/init_sweetalert';
import { functionValidation } from '../components/form';
import { price } from '../plugins/price';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  calendarPat();
  calendarPatTwo();
  flatpickrDisplay();
  loadDynamicBannerText();
  AOS.init();
  sweetAlertDanger();
  functionValidation();
  sweetAlertNOK();
  alertNewBooking();
  sweetAlertMessage();
  price();
});
