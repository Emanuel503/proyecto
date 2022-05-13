//Mensajes alert
window.setTimeout(function(){
    $(".alert").fadeTo(1500, 0).slideDown(1000,function(){
        $(this).remove();
    })
}, 1500);

function eliminarProgramador(id){
    let opcion = confirm("¿Estas seguro que quieres eliminar este programador?");
    if (opcion){
        location.href = "controllerUsuariosProgramadores.jsp?id="+id+"&opcion=eliminarProgramador";
    }
}

function eliminarUsuario(id){
    let opcion = confirm("¿Estas seguro que quieres eliminar este usuario?");
    if (opcion){
        location.href = "controllerUsuarios.jsp?id="+id+"&opcion=eliminarUsuario";
    }
}

function eliminarDepartamento(id){
    let opcion = confirm("¿Estas seguro que quieres eliminar este departamento?");
    if (opcion){
        location.href = "controllerDepartamentos.jsp?id="+id+"&opcion=eliminarDepartamento";
    }
}

function eliminarCasoRequerimiento(id){
    let opcion = confirm("¿Estas seguro que quieres eliminar este caso?");
    if (opcion){
        location.href = "controllerCasos.jsp?id="+id+"&opcion=eliminarCasoRequerimiento";
    }
}

function eliminarBitacora(id){
    let opcion = confirm("¿Estas seguro que quieres eliminar esta bitacora?");
    if (opcion){
        location.href = "controllerBitacora.jsp?id="+id+"&opcion=eliminarBitacora";
    }
}