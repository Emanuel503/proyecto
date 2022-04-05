//Mensajes alert
window.setTimeout(function(){
    $(".alert").fadeTo(1500, 0).slideDown(1000,function(){
        $(this).remove();
    })
}, 1500);

function eliminarUsuario(id){
    let opcion = confirm("¿Estas seguro que quieres elimianar este usuario?");
    if (opcion){
        location.href = "controllerUsuarios.jsp?id="+id+"&opcion=eliminarUsuario";
    }
}

function eliminarDepartamento(id){
    let opcion = confirm("¿Estas seguro que quieres elimianar este departamento?");
    if (opcion){
        location.href = "controllerDepartamentos.jsp?id="+id+"&opcion=eliminarDepartamento";
    }
}