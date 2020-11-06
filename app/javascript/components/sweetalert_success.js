import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
      swal(options);
  }
};
const functionValidationForm = () => {
const form = document.querySelector('.new_page')
form.addEventListener('submit', (event) => {
  event.preventDefault();
  checkInputs();
  });

};

const sweetAlertSuccess = () => {
  const sweetAlert = document.getElementById('success-form')
  const form = document.querySelector('.new_page')
   if (sweetAlert) {
    form.addEventListener('submit',(event) => {
      initSweetalert('#sweet-alert-message', {
      title: "Message sent",
      text: "We will get back to you shortly.",
      icon: "success"
      });
    });
  }

};


const checkInputs = () => {

};

export { sweetAlertSuccess };
