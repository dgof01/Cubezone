const formularioCliente = document.getElementById('formularioCliente')
const notificacionProceso = document.getElementById('notificacionProceso')

const nombre = document.getElementById('id_nombre')
const primerApellido = document.getElementById('id_primerApellido')
const segundoApellido = document.getElementById('id_segundoApellido')
const correo = document.getElementById('id_correo')
const csrf = document.getElementsByName('csrfmiddlewaretoken')[0].value

const notificacion = (type, msg) => {
    notificacionProceso.innerHTML = 
    `<div class="alert alert-${type}" role="alert">
        ${msg}
    </div>`
}

formularioCliente.addEventListener('submit', e=> {
    e.preventDefault()
    const formData = new FormData()
    formData.append('csrfmiddlewaretoken', csrf)
    formData.append('nombre', nombre.value)
    formData.append('primerApellido', primerApellido.value)
    formData.append('segundoApellido', segundoApellido.value)
    formData.append('correo', correo.value)
    $.ajax({
        type: 'POST',
        url: '/clientes/agregarCliente/',
        data: formData,
        success: function(response) {
            console.log(response)
            notificacion('success','Cliente Agregado')
            formularioCliente.reset()
        },
        error: function(error){
            console.log(error)
            notificacion('danger','Algo ha salido mal')
        },
        processData: false,
        contentType: false,
    })
})