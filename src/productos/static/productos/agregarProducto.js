const formularioProducto = document.getElementById('formularioProducto')
const notificacionProceso = document.getElementById('notificacionProceso')

const nombre = document.getElementById('id_nombre')
const precio = document.getElementById('id_precio')
const csrf = document.getElementsByName('csrfmiddlewaretoken')[0].value

const notificacion = (type, msg) => {
    notificacionProceso.innerHTML = 
    `<div class="alert alert-${type}" role="alert">
        ${msg}
    </div>`
}

formularioProducto.addEventListener('submit', e=> {
    console.log("enviando datos")
    e.preventDefault()
    const formData = new FormData()
    formData.append('csrfmiddlewaretoken', csrf)
    formData.append('nombre', nombre.value)
    formData.append('precio', precio.value)
    $.ajax({
        type: 'POST',
        url: '/productos/agregar/',
        data: formData,
        success: function(response) {
            console.log(response)
            notificacion('success','Producto agregado correctamente')
            formularioProducto.reset()
        },
        error: function(error){
            console.log(error)
            notificacion('danger','Algo ha salido mal')
        },
        processData: false,
        contentType: false,
    })
})