const btnReporte = document.getElementById('btnReporte')
const img = document.getElementById('img')
const modalBody = document.getElementById('modal-body')
const formularioReporte = document.getElementById('formularioReporte')
const notificacionProceso = document.getElementById('notificacionProceso')

const nombre = document.getElementById('id_nombre')
const comentarios = document.getElementById('id_comentarios')
const csrf = document.getElementsByName('csrfmiddlewaretoken')[0].value

const notificacion = (type, msg) => {
    notificacionProceso.innerHTML = 
    `<div class="alert alert-${type}" role="alert">
        ${msg}
    </div>`
}

if (img) {
    btnReporte.classList.toggle('oculto')
    btnReporte.classList.toggle('btnAgregar')
}

btnReporte.addEventListener('click', ()=>{
    console.log('agregando reporte')
    img.setAttribute('class', 'w-100')
    modalBody.prepend(img)

    formularioReporte.addEventListener('submit', e=> {
        e.preventDefault()
        const formData = new FormData()
        formData.append('csrfmiddlewaretoken', csrf)
        formData.append('nombre', nombre.value)
        formData.append('comentarios', comentarios.value)
        formData.append('imagen', img.src)
        
        $.ajax({
            type: 'POST',
            url: '/reportes/guardar/',
            data: formData,
            success: function(response) {
                console.log(response)
                notificacion('success','Reporte agregado')
                formularioReporte.reset()
            },
            error: function(error){
                console.log(error)
                notificacion('danger','Algo ha salido mal')
            },
            processData: false,
            contentType: false,
        })
    })
})