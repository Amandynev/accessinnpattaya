import swal from 'sweetalert';

const functionValidation = () => {
  const name = document.querySelector('.contact-form-name')
  const email = document.querySelector('.contact-form-email')
  const phone = document.querySelector('.contact-form-phone')
  const message = document.querySelector('.contact-form-message')
  name.addEventListener('blur', (event) => {
    event.preventDefault();
    checkInputsName();
  });

  email.addEventListener('blur', (event) => {
    event.preventDefault();
    checkInputsEmail();
  });
  phone.addEventListener('blur', (event) => {
    event.preventDefault();
    checkInputsPhone();
  });
  message.addEventListener('blur', (event) => {
    event.preventDefault();
    checkInputsMessage();
  });

  const form = document.querySelector('.new_page')
  form.addEventListener('submit',(event) => {
    const success = document.querySelectorAll('.success')
    if(success.length === 3){
      initSweetalert('#sweet-alert-message', {
      title: "Message sent",
      text: "We will get back to you shortly.",
      icon: "success"
      });
    };
  });
};

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) {
    swal(options);
  }
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
  } else if(!isEmail(emailValue)) {
    setFailedFor(email, 'Email is not valid');
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
    setFailedFor(message, 'Message cannot be blank');
  } else {
    setSuccessFor(message);
  };
}

const setFailedFor = (input, message) => {
  const formControl = input.parentElement.parentElement; // la class parente
  const small = formControl.querySelector('small');
  formControl.classList.remove("success");
  formControl.classList.add("failed");
  small.innerText = message;
};

const setSuccessFor = (input) => {
  const formControl = input.parentElement.parentElement ;
  formControl.classList.remove("failed");
  formControl.classList.add("success");
};

const isEmail = (email) => {
  const regex = /^([\w\d._\-#])+@([\w\d._\-#]+[.][\w\d._\-#]+)+$/.test(email);
  return regex
};

export { functionValidation };

