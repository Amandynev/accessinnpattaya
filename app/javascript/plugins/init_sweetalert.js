import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback);
    });
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

const sweetAlertDanger = () => {
  const deleteIcons = document.querySelectorAll('.card-booking > i')
  if (deleteIcons) {
    deleteIcons.forEach((icon) => {
      const id = icon.dataset.id;
      initSweetalert(`#delete-icon-${id}`, {
      title: "Are you sure ?",
      text: "This action cannot be reversed.",
      icon: "warning"
      }, (value) => {
        if (value) {
          const link = document.querySelector(`#delete-link-${id}`);
          link.click();
        }
      });
    })
  }
}

const alertNewBooking = () => {
 const modal = document.getElementById('booking-success')
 if (modal) {
    initSweetalert('#sweet-alert-booking', {
    title: "Room pre-booked !",
    text: "The room have been pre-booked for 30 minutes, please proceed to the payment to completed your reservation.",
    icon: "success"
    });
  }   
};

export { sweetAlertNOK, sweetAlertDanger, alertNewBooking };
