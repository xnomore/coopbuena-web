document.addEventListener("DOMContentLoaded", () => {
  ScrollReveal().reveal('.content-container', {
    distance: '70px',
    opacity: 0,
    duration: 800,
    easing: 'ease-out'
  });

  var from_bottom = {
    distance: '100px',
    opacity: 0,
    origin: "bottom",
    duration: 800,
    easing: 'ease-out',
    delay: 300
  };

  var from_top = {
    distance: '100px',
    opacity: 0,
    origin: "top",
    duration: 800,
    easing: 'ease-out',
    delay: 300
  };

  /***** Landing page *****/

  // Sobre nosotros

  ScrollReveal().reveal('.card-mision', from_bottom);
  ScrollReveal().reveal('.card-vision', from_top);
  ScrollReveal().reveal('.card-values', from_bottom);
  ScrollReveal().reveal('.card-join', from_top);

  // Nuestros servicios

  ScrollReveal().reveal('.card-savings', from_top);
  ScrollReveal().reveal('.card-lend', from_bottom);
  ScrollReveal().reveal('.card-credit-card', from_top);
  ScrollReveal().reveal('.card-transactions', from_bottom);



});