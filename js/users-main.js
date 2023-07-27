import { User } from "./class-users.js";

const user = new User();

// Rgistrar usuarios

const btnSend = document.querySelector(".btn.send");
const btnShowPassword = document.querySelector("#btn-show-password");
let showPassword = false;
const inpPassword = document.querySelector("#inp-password");

function addNewUser(e) {
  e.preventDefault();

  let name = document.querySelector("#inp-name").value;
  let lastname = document.querySelector("#inp-lastname").value;
  let email = document.querySelector("#inp-email").value;
  let dni = document.querySelector("#inp-identification-card").value;
  let celphone = document.querySelector("#inp-cell-phone").value;
  let telphone = document.querySelector("#inp-tell-phone").value;
  let address = document.querySelector("#inp-address").value;
  let birthdate = document.querySelector("#inp-birthdate").value;
  let gender = document.querySelector("#inp-gender").value;
  let civilStatus = document.querySelector("#inp-civil-status").value;
  let ocupation = document.querySelector("#inp-ocupation").value;
  let username = document.querySelector("#inp-user").value;
  let password = document.querySelector("#inp-password").value;

  //console.log(name.value, lastname.value, email.value, dni.value, celphone.value, telphone.value, address.value, birthdate.value, gender.value, civilStatus.value, ocupation.value);

  if (name == "" || lastname == "" || email == "" || dni == "" || celphone == "" || telphone == "" || address == "" || birthdate == "" || gender == "" || civilStatus == "" || ocupation == "" || username == "" || password == "") {
    user.showError("Todos los campos deben estar llenos correctamente.");
  } else {
    user.registerUser(name, lastname, email, dni, celphone, telphone, address, birthdate, gender, civilStatus, ocupation, username, password);
  }
}

if (location.href.includes("registerUser.html")) {
  btnSend.addEventListener("click", addNewUser);

  // Ver y ocultar contraseña

  btnShowPassword.addEventListener("click", (e) => {
    e.preventDefault();

    if (!showPassword) {
      btnShowPassword.textContent = "Ocultar contraseña";
      inpPassword.type = "text";
      showPassword = true;
    } else {
      btnShowPassword.textContent = "Ver contraseña";
      inpPassword.type = "password";
      showPassword = false;
    }
  });
}




// Iniciar sesión

if (location.href.includes("login.html")) {
  const btnLogin = document.querySelector(".btn-login");

  btnLogin.addEventListener("click", (e) => {
    e.preventDefault();

    let inpEmail = document.querySelector("#inp-email").value;
    let inpPassword = document.querySelector("#inp-password").value;

    const results = localStorage.getItem("user");
    const results1 = JSON.parse(results);
    const primerValor = results1[0];
    const segundoValor = results1[1];

    //console.log(localStorage.user);

    if (inpEmail == primerValor && inpPassword == segundoValor) {
      //user.showError("Iniciar sesión");
      document.querySelector("#inp-email").value = "";
      document.querySelector("#inp-password").value = "";
      location.href = "userHome.html";
      localStorage.setItem("login", true);
    } else {
      user.showError("Usuario o contraseña incorrecta.");
    }

  });

}


