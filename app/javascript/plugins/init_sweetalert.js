import swal from 'sweetalert';
import I18n from 'i18n-js/index.js.erb';

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


const initSweetalertDOMCall = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swal(options).then(callback);
  }
};


const sweetAlertNOK = () => {
  const modal = document.getElementById('booking-canceled');
  if (modal){
    initSweetalertDOM('#sweet-alert-booking', {
    title: I18n.t('js.canceled'),
    text: I18n.t('js.canceled-text'),
    icon: "error"
    });
  }
}

const sweetAlertMessage = () => {
  const message = document.getElementById('message-sent');
  if (message){
    initSweetalertDOM('#page_message', {
    title: I18n.t('js.sent'),
    text: I18n.t('js.sent-text'),
    icon: "success"
    });
  }
}

const alertNewBooking = () => {

  const modal = document.getElementById('booking-success');
  if (modal) {
    initSweetalertDOMCall('#sweet-alert-booking', {
    title: I18n.t('js.booked'),
    text: I18n.t('js.booked-text'),
    icon: "success",
    buttons: { close: false, confirm: { text: 'PAY NOW' }}
    }, (value) => {
      if (value) {
        const link = document.querySelector('#all_my_bookings');
        link.click()
      }
    });
  }
};



const sweetAlertDanger = () => {
  const deleteIcons = document.querySelectorAll('.card-booking > i')
  if (deleteIcons) {
    deleteIcons.forEach((icon) => {
      const id = icon.dataset.id;
      initSweetalertClick(`#delete-icon-${id}`, {
      title: I18n.t('js.sure'),
      text: I18n.t('js.delete'),
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

export { sweetAlertNOK, sweetAlertDanger, alertNewBooking, sweetAlertMessage };

