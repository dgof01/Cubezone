const btn = document.getElementById("btn_AgregarVenta")
const div = document.getElementById("agregarVenta")

btn.addEventListener('click', ()=>{
    div.classList.toggle("agregarVentaMT")
})