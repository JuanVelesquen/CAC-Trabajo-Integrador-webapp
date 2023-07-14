const modificar = document.getElementById("modificar");
const cancelar = document.getElementById("eliminar");
const formulario = document.getElementById("form-new");
let resumen, borrar,btnNO_Cancelar;
let flag = false;
let cancelFlag =  false;
function deleteCancelar(){
		let inputHid = document.createElement("input");
		inputHid = document.querySelector(".ticketNumber");
		console.log(inputHid);
		formulario.appendChild(inputHid);
		const eliminarCancelTicketBtn = document.querySelector(".cancelarTicketForm");
		const eliminarCancelTicketTitle = document.querySelector("#cancelTicketTitle");
		eliminarCancelTicketBtn.remove();
		eliminarCancelTicketTitle.remove();
		cancelFlag = false;
}
modificar.addEventListener("click", () =>{
	if(!flag){
		if(cancelFlag){
			deleteCancelar()
		}
	let section = document.createElement("section");
	section.classList.add("formulario");
	let divTitle = document.createElement("div");
	divTitle.classList.add("title");
	let text = document.createTextNode("Modificacion de Ticket");
	let titleH3 = document.createElement("h2");
	titleH3.appendChild(text);
	divTitle.appendChild(titleH3);
	section.appendChild(divTitle);
	let divFormBody = document.createElement("div");
	divFormBody.classList.add("formulario__body");
	let divFormBody_NyA = document.createElement("div");
	divFormBody_NyA.classList.add("formulario__nombre-apellido");
	let inputNombre = document.createElement("input");
	inputNombre.setAttribute("type","text");
	inputNombre.setAttribute("name","nombre");
	inputNombre.setAttribute("id","nombre");
	inputNombre.setAttribute("placeholder","Nombre");
	let inputApellido = document.createElement("input");
	inputApellido.setAttribute("type","text");
	inputApellido.setAttribute("name","apellido");
	inputApellido.setAttribute("id","apellido");
	inputApellido.setAttribute("placeholder","Apellido");
	divFormBody_NyA.appendChild(inputNombre);
	divFormBody_NyA.appendChild(inputApellido);
	divFormBody.appendChild(divFormBody_NyA);
	section.appendChild(divFormBody);
	let email = document.createElement("input");
	email.setAttribute("type","text");
	email.setAttribute("name","correo");
	email.setAttribute("id","correo");
	email.setAttribute("placeholder","Correo");
	divFormBody.appendChild(email);
	let divForm_CyC = document.createElement("div");
	divForm_CyC.classList.add("formulario__cantidad-categoria");
	let div_CyC = document.createElement("div");
	div_CyC.classList.add("cantidad-categoria");
	let label = document.createElement("label");
	label.setAttribute("for","cantidad");
	text = document.createTextNode("Cantidad");
	label.appendChild(text);
	let inputCantidad =  document.createElement("input");
	inputCantidad.setAttribute("type","text");
	inputCantidad.setAttribute("id","cantidad");
	inputCantidad.setAttribute("name","cantidad");
	inputCantidad.setAttribute("placeholder","Cantidad");
	div_CyC.appendChild(label);
	div_CyC.appendChild(inputCantidad);
	divForm_CyC.appendChild(div_CyC);
	divFormBody.appendChild(divForm_CyC);
	let div_CyC2 = document.createElement("div");
	div_CyC2.classList.add("cantidad-categoria");
	let label2 = document.createElement("label");
	label2.setAttribute("for","categoria");
	label2.innerText = "Categoria";
	div_CyC2.appendChild(label2);
	let selectCategoria =  document.createElement("select");
	selectCategoria.name = "categoria";
	selectCategoria.id = "categoria";
	let values = ["estudiante","trainee","junior"];
	let optionTxt = ["Estudiante","Trainee","Junior"]; 
	for(let i = 0; i < 3; i++){
		let option = document.createElement("option");
		option.value = values[i];
		option.text = optionTxt[i];
		selectCategoria.appendChild(option);
	}
	div_CyC2.appendChild(selectCategoria);
	divForm_CyC.appendChild(div_CyC2);
	let divTotalPagar = document.createElement("div");
	divTotalPagar.classList.add("total-pagar-container");
	divFormBody.appendChild(divTotalPagar);
	let para = document.createElement("p");
	para.setAttribute("name","total");
	text = document.createTextNode("Total a pagar:");
	para.appendChild(text);
	let paraTOTAL = document.createElement("p");
	paraTOTAL.setAttribute("id","total-pagar");
	text = document.createTextNode("$");
	paraTOTAL.appendChild(text);
	divTotalPagar.appendChild(para);
	divTotalPagar.appendChild(paraTOTAL);
	let divBtn_ByR = document.createElement("div");
	divBtn_ByR.classList.add("botones-borrar-resumen");
	let btn1 = document.createElement("button");
	btn1.setAttribute("type","button");
	btn1.setAttribute("id","borrar");
	btn1.innerHTML = "Borrar";
	let btn2 = document.createElement("button");
	btn2.setAttribute("type","button");
	btn2.setAttribute("id","resumen");
	btn2.innerHTML = "Modificar";
	divBtn_ByR.appendChild(btn1);
	divBtn_ByR.appendChild(btn2);
	divFormBody.appendChild(divBtn_ByR);
	formulario.appendChild(section);
	borrar = document.getElementById("borrar");
	resumen = document.getElementById("resumen")
	inputNombre.value = document.getElementById("nombreTH").innerHTML;
	inputApellido.value = document.getElementById("apellidoTH").innerHTML;
	email.value = document.getElementById("correoTH").innerHTML;
	email.innerHTML = document.getElementById("correoTH").innerHTML;
	inputCantidad.value = document.getElementById("cantidadTH").innerHTML;
	const txt = document.getElementById("categoriaTH").innerHTML.trim();
	if( txt == values[0]){
		console.log("hola1");
		selectCategoria.value = values[0];
	}else if(txt== values[1]){
		console.log("hola2");
		selectCategoria.value = values[1];	
	}else if(txt == values[2]){
		console.log("hola3");
		selectCategoria.value = values[2];
	}
	
	paraTOTAL.value = document.getElementById("totalTH").innerHTML;
	paraTOTAL.innerHTML = document.getElementById("totalTH").innerHTML;
	flag = true;
	}
	function validar(cant){
    const nombre = document.getElementById("nombre").value;
    const apellido = document.getElementById("apellidoTH").innerHTML;
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
    if( !expr.test(correo.trim()) ){
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
	    let categoria = document.getElementById("categoria").value;
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
	        btn.setAttribute("type","submit");
	        var form = document.querySelector(".botones-borrar-resumen");
	        var text = document.createTextNode("Confirmar");
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
    document.getElementById("total-pagar").innerHTML = "$" + 0;
    if(document.querySelector(".submit") != null){
        var deleteBTN = document.querySelector(".submit");
        deleteBTN.remove();
    }
})


cancelar.addEventListener("click", () =>{
	if(flag == true){
		flag =  false;
		 const eliminar =  document.querySelector(".formulario");
		 eliminar.remove();
	 }
	 let formConfirmation =  document.createElement("form");
	 formConfirmation.id = ("formulario");
	 formConfirmation.setAttribute("action","../java/modificarCa.jsp");
	 const sectionConf = document.getElementsByTagName("section");
	 sectionConf.appendChild(formConfirmation);
	 
	 let pregH3 =  document.createElement("h3");
	 pregH3.innerHTML =  "Esta seguro que desea cancelar su ticket?"
	 let btnSI = document.createElement("button");
	btnSI.setAttribute("type","submit");
	btnSI.innerHTML = "Si";
	let btnNO = document.createElement("button");
	btnNO.setAttribute("type","button");
	btnNO.innerHTML = "No";
	
})
    
})

cancelar.addEventListener("click", () =>{
	if(!cancelFlag){
		cancelFlag = true;
		let formConfirmation =  document.createElement("form");
		 formConfirmation.id = ("formulario");
		 formConfirmation.className = "cancelarTicketForm"
		 formConfirmation.setAttribute("action","../java/modificarCancelacion.jsp");
		 const sectionConf = document.getElementById("section");
		 
		 let divTitle = document.createElement("div");
		divTitle.classList.add("title");
		divTitle.id = "cancelTicketTitle";
		 let pregH3 =  document.createElement("h2");
		 pregH3.innerHTML =  "¿Estas seguro que desea cancelar su ticket?"
		 divTitle.appendChild(pregH3);
		 sectionConf.appendChild(divTitle);
		let divBtn_ByR = document.createElement("div");
		divBtn_ByR.classList.add("botones-borrar-resumen");
		let btn1 = document.createElement("button");
		btn1.setAttribute("type","button");
		btn1.setAttribute("id","buttonNo");
		btn1.innerHTML = "No";
		let btn2 = document.createElement("button");
		btn2.setAttribute("type","submit");
		btn2.innerHTML = "Si";
		divBtn_ByR.appendChild(btn1);
		divBtn_ByR.appendChild(btn2);
		sectionConf.appendChild(formConfirmation);
		let divFormBody = document.createElement("div");
		divFormBody.classList.add("formulario__body");
		divFormBody.appendChild(divBtn_ByR);
		
		let inputHid = document.createElement("input");
		inputHid = document.querySelector(".ticketNumber");
		console.log(inputHid);
		formConfirmation.appendChild(inputHid);
		formConfirmation.appendChild(divFormBody);
		btnNO_Cancelar = document.getElementById("buttonNo");
	}
	if(cancelFlag){
	btnNO_Cancelar.addEventListener("click", () =>{
			deleteCancelar();
			console.log("hola");
		})
	}
	 
	
})

		
		
