import swal from 'sweetalert';
const functionValidation = () => {

  const form = document.querySelector('.new_page')
  const name = document.querySelector('.contact-form-name')
  const email = document.querySelector('.contact-form-email')
  const phone = document.querySelector('.contact-form-phone')
  const message = document.querySelector('.contact-form-message')


name.addEventListener('blur', (event) => {
  console.log(event);
  event.preventDefault();
  checkInputsName();
  });
email.addEventListener('blur', (event) => {
  console.log(event);
  event.preventDefault();
  checkInputsEmail();
  });
phone.addEventListener('blur', (event) => {
  console.log(event);
  event.preventDefault();
  checkInputsPhone();
  });
message.addEventListener('blur', (event) => {
  console.log(event);
  event.preventDefault();
  checkInputsMessage();
  });

};

  const checkInputsName = () => {
    const name = document.querySelector('.contact-form-name');
  // 1 on récupere les valueurs des inputs
    const nameValue = name.value ;
      if(nameValue === ''){
        setFailedFor(name, 'Name cannot be blank');
      } else {
        setSuccessFor(name);
      };
  };

  const checkInputsEmail = () => {
    const email = document.querySelector('.contact-form-email');
  // 1 on récupere les valueurs des inputs
    const emailValue = email.value ;
      if(emailValue === '') {
        setFailedFor(email, 'Email cannot be blank');
      } else {
        setSuccessFor(email);
      }
  };

   const checkInputsPhone = () => {
    const phone = document.querySelector('.contact-form-phone');
  // 1 on récupere les valueurs des inputs
    const phoneValue = phone.value ;
      if(Number.isInteger(phoneValue)) {
        setSuccessFor(phone);
      } else {
        return 'This is not a number';
      }
  };

  const checkInputsMessage = () => {
    const message = document.querySelector('.contact-form-message');
    const messageValue = message.value ;
      if(messageValue === ''){
        setFailedFor(message, 'Name cannot be blank');
      } else {
        setSuccessFor(message);
      };
  }

    const setFailedFor = (input, message) => {
      const formControl = input.parentElement // la class parente
      const small = formControl.querySelectorAll('small');

      formControl.className = 'form-control-access failed';


      small.value = message;

    };

   const setSuccessFor = (input) => {
    const formControl = input.parentElement ;
    formControl.className = 'form-control-access success';

   };


export { functionValidation };
