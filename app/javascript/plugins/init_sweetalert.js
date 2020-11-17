import swal from 'sweetalert';

const initSweetalertClick = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback);
    });
  }
};

const initSweetalertDOM = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swal(options);
  }
};

const sweetAlertNOK = () => {
  const modal = document.getElementById('booking-canceled');
  if (modal){
    initSweetalertDOM('#sweet-alert-booking', {
      title: "Booking canceled",
      text: "Sorry, there is no availabilities for the choosen dates.",
      icon: "error"
    });
  }
}

const alertNewBooking = () => {

  const modal = document.getElementById('booking-success');
  if (modal) {
    initSweetalertDOM('#sweet-alert-booking', {
      title: "Room Pre-Booked !",
      text: "The room have been pre-booked for 30 minutes, please proceed to the payment to completed your reservation.",
      icon: "success",
      buttons: {
        cancel: true,
        confirm: {
          text: 'PAY NOW'
        }
      },
    });
  }
};



const sweetAlertDanger = () => {
  const deleteIcons = document.querySelectorAll('.card-booking > i')
  if (deleteIcons) {
    deleteIcons.forEach((icon) => {
      const id = icon.dataset.id;
      initSweetalertClick(`#delete-icon-${id}`, {
      title: "Are you sure ?",
      text: "This action cannot be reversed.",
      icon: "warning"
      }, (value) => {
        console.log(value)
        if (value) {
          const link = document.querySelector(`#delete-link-${id}`);
          link.click();
        }
      });
    })
  }
}

export { sweetAlertNOK, sweetAlertDanger, alertNewBooking };

