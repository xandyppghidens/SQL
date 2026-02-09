let div = document.querySelector('#fazer');
let msg = document.querySelector('#mensagem'); 
div.addEventListener('click', function() {
    msg.innerHTML = "Isso é uma pequena demostração de como o python e o php e o Js pode ser usado para manipular o obj. ";
    msg.style.color = "green";
    msg.style.fontSize = "20px";
    msg.style.fontWeight = "bold";
    msg.style.textAlign = "center";
    msg.style.marginTop = "30px";
});