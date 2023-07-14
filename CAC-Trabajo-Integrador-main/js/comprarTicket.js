const select = document.getElementById("categoria");
const resumen = document.getElementById("resumen");
const borrar = document.getElementById("borrar");

//validacion
function validar(cant){
    const nombre = document.getElementById("nombre").value;
    const apellido = document.getElementById("apellido").value;
    const correo = document.getElementById("correo").value;
    var expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if(nombre.trim().length == 0){
        alert("Error: Ingrese un nombre");
        return false;
    }
    if(apellido.trim().length == 0){
        alert("Error: Ingrese un apellido ");
        return false;
    }
    if( !expr.test(correo) ){
        alert("Error: Ingrese un correo valido");
        return false;
    }
    if(cant.trim().length == 0){
        alert("Error: Ingrese cantidad de entradas");
        return false;
    }
    return true;
}

//calcular la cantidad total del precio de la/s entrada/s
resumen.addEventListener("click", () =>{
    const cant = document.getElementById("cantidad").value;
    let v = validar(cant);
    if(!(v)){
        return;
    }
    let categoria = select.value;
    let cantidad = parseInt(cant);
    let suma = 0;
    if(categoria == "estudiante"){
        suma = cantidad * 200 * 0.2;
    }else if(categoria == "trainee"){
        suma = cantidad * 200 *  0.5;
    }else if(categoria == "junior"){
        suma = cantidad * 200 * 0.85;
    }
    document.getElementById("total-pagar").innerHTML = "$" + suma;
    if(document.querySelector(".submit") == null){
        var btn = document.createElement("BUTTON");
        btn.classList.add("submit");
        var form = document.querySelector(".botones-borrar-resumen");
        var text = document.createTextNode("Comprar");
        btn.appendChild(text);
        form.appendChild(btn);
    }

    
})
//restablecer todos los datos ingresados
borrar.addEventListener("click", () =>{
    document.getElementById("cantidad").value = null;
    document.getElementById("categoria").value = "estudiante";
    document.getElementById("nombre").value = null;
    document.getElementById("apellido").value = null;
    document.getElementById("correo").value = null;
    document.getElementById("total-pagar").innerHTML = "$";
    if(document.querySelector(".submit") != null){
        var deleteBTN = document.querySelector(".submit");
        deleteBTN.remove();
    }
})