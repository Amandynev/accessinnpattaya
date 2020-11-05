import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
      swal(options);
  }
};

const sweetAlertSuccess = () => {
  const buttonSubmit = document.getElementById('sweet-alert-message')
   if (buttonSubmit) {
    buttonSubmit.addEventListener('click',(event) => {
      initSweetalert('#sweet-alert-message', {
      title: "Message sent",
      text: "We will get back to you shortly.",
      icon: "success"
      });
    });
  }

};

export { sweetAlertSuccess };
