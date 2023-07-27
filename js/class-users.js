export class User {

  constructor() { }

  registerUser(name, lastname, email, dni, personalPhone, localPhone,
    address, birthdate, gender, civilStatus, ocupation, username, password) {

    console.log(name, lastname, email, dni, personalPhone, localPhone,
      address, birthdate, gender, civilStatus, ocupation, username, password);

    localStorage.setItem("user", JSON.stringify([username, password]));
  }

  showError(messsage) {
    console.log(messsage);
  }
}