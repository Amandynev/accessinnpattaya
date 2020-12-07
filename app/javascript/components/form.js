import swal from 'sweetalert';
import I18n from "i18n-js";


const functionValidation = () => {
  const name = document.querySelector('.contact-form-name')
  const email = document.querySelector('.contact-form-email')
  const phone = document.querySelector('.contact-form-phone')
  const message = document.querySelector('.contact-form-message')
  if (name) {
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
  }
};

const checkInputsName = () => {
  const name = document.querySelector('.contact-form-name');
// 1 on récupere les valueurs des inputs
  const nameValue = name.value ;
  if(nameValue === ''){
    setFailedFor(name,I18n.t('js.form-name'));
  } else {
    setSuccessFor(name);
  };
};

const checkInputsEmail = () => {
  const email = document.querySelector('.contact-form-email');
// 1 on récupere les valueurs des inputs
  const emailValue = email.value ;
  if(emailValue === '') {
    setFailedFor(email, I18n.t('js.form-email-blank'));
  } else if(!isEmail(emailValue)) {
    setFailedFor(email, I18n.t('js.form-email-valid'));
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
    setFailedFor(message, I18n.t('js.form-message'));
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

