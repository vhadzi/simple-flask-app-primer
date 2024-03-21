//Validacija forme pre slanja
function validateForm() {
    let ime=validateIme();
    let prezime=validatePrezime();
    let email=validateEmail();
    let datum=validateDatum();
    let mesta=validateMesta();
    if( ime && prezime && email && datum && mesta){
      alert("Na navedenu email adresu poslata je poruka sa podacima o zahtevu za rezervaciju, kao i link za potvrdu zahteva. Potvrdite zahtev u narednih 30 minuta. Hvala!");
      return true
    }
    else return false
}
//validacija unetog imena, jedna reč, samo slova
function validateIme() {
    let x = document.getElementById("ime").value;
        
    if (!/^[a-zšđčćž]+$/i.test(x)) {
      //postavljanje poruke ukoliko nije validno ime
      document.getElementById("imePoruka").innerHTML="Molimo Vas da pravilno unesete ime.";
      return false
    }
    else {
      // brisanje poruke za ime ukoliko je postavljena u prethodnoj proveri
        document.getElementById("imePoruka").innerHTML="";
      return true
    }       
}
//validacija prezimena, jedna reč, dve reči (npr. Kocić Petković) ili dve reči sa crticom (npr. Hadži-Đokić)
function validatePrezime() {
    let x = document.getElementById("prezime").value;
    if (!/^[a-zšđčćž]+((?:\s[a-zšđčćž]+)?|(?:-[a-zšđčćž]+)?)$/i.test(x)) {
      document.getElementById("prezimePoruka").innerHTML="Molimo Vas da pravilno unesete prezime.";
      return false
    }
    else {
      document.getElementById("prezimePoruka").innerHTML="";
      return true
    }
}
// validacija email adrese 
function validateEmail() {
    let x = document.getElementById("email").value;
   
    if (!/^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/i.test(x)) {
      document.getElementById("emailPoruka").innerHTML="Molimo Vas da pravilno unesete adresu elektronske pošte.";
      return false
    }
    else {
      document.getElementById("emailPoruka").innerHTML="";
      return true
    }
}
// validacija datuma, provera da nije izabran trenutni dan ili neki datum u prošlosti
function validateDatum(){
    let x = new Date(document.getElementById("datum").value);
        
    if (x <= Date.now()) {
      document.getElementById("datumPoruka").innerHTML="Rezervacije se razmatraju samo za naredne dane! Ne šaljite zahtev za današnji dan ili ranije datume!";
      return false
    }
    else {
        document.getElementById("datumPoruka").innerHTML="";
        return true 

    } 
  }
//validacija za broj mesta/provera da nije ostavljeno blanko polje
function validateMesta() {
  let x = document.getElementById("mesta").value;
 
  if (x === "") {
    document.getElementById("mestaPoruka").innerHTML="Molimo Vas da pravilno unesete broj mesta za rezervaciju (od 1 do maksimalnih 100)";
    return false
  }
  else {
    document.getElementById("mestaPoruka").innerHTML="";
    return true
  }
}
// provera za izabrani broj mesta i omogućavanje izbora spajanja više stolova    
function spojeniStolovi(){
    let x=document.getElementById("mesta").value;
   
    if (x >= 6) {

        document.getElementById("spajanje").style.display='block';
    }
    else {
        document.getElementById("spajanje").style.display='none';
    }
}
//uklanjanja poruka o greškama pri resetovanju forme
function clearForm(){
    var lista = document.getElementsByClassName("poruka");
    for(let i=0;i<lista.length;i++){
        lista[i].innerHTML="";
    }
    document.getElementById("spajanje").style.display='none';
}
//uklanjanjae blanko znakova na početku i kraju stringova iz polja za unos 
function trimValues(el) {
  let x = el.value.trim();
  el.value=x;
}