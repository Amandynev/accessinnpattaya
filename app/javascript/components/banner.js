import Typed from'typed.js';


const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Access Inn Pattaya"],
    typeSpeed: 80,
    loop: true
  });
}

export {loadDynamicBannerText};
