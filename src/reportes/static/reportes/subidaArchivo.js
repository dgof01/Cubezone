const csrf = document.getElementsByName('csrfmiddlewaretoken')[0].value 
const notificacionProceso = document.getElementById('notificacionProceso')

const notificacion = (type, msg) => {
    notificacionProceso.innerHTML = 
    `<div class="alert alert-${type}" role="alert">
        ${msg}
    </div>`
}

Dropzone.autoDiscover = false
const myDropzone = new Dropzone('#my-dropzone', {
    url: '/reportes/archivoCargado/',
    init: function() {
        this.on('sending', function(file, xhr, formData){
            console.log('sending')
            formData.append('csrfmiddlewaretoken', csrf)
        })
        this.on('success', function(file, response){
            console.log(response.ex)
            if(response.ex) {
                notificacion('danger', 'El archivo ya fue subido')
            } else {
                notificacion('success', 'El archivo se subió correctamente')
            }
        })
    },
    maxFiles: 3,
    maxFilesize: 3,
    acceptedFiles: '.csv'
})