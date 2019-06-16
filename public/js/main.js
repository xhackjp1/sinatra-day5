window.onload = function(){
  let dec = document.getElementById("decimal");
  let bin = document.getElementById("binary");

  let toBinary = (n) => parseInt(n.toString(2));
  let number = 0;

  setInterval(update, 200)

  function update()
  {
    dec.innerText = number;
    bin.innerText = toBinary(number);
    number++;
  }
}
