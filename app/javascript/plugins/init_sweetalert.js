import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
      swal(options);
  }
};

const sweetAlertNOK = () => {
  const modal = document.getElementById("booking-canceled");
  if (modal) {
    initSweetalert('#sweet-alert-booking', {
    title: "Booking canceled",
    text: "Sorry, there is no availabilities for the choosen dates.",
    icon: "error"
    });
  }
}

export { sweetAlertNOK };