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

const alertNewBooking = () => {
 const form = document.querySelector('#new_booking')
    form.addEventListener('submit',(event) => {
        initSweetalert('#sweet-alert-booking', {
        title: "Room pre-booked !",
        text: "The room have been pre-booked for 30 minutes, please proceed to the payment to completed your reservation.",
        icon: "success"
        });
    });
};

export { alertNewBooking } ;

export { sweetAlertNOK };
