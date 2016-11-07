/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var ValidaMatricula = function(){
       
    $("#listar-todos").on("change", function(){
        
        if($(this).is(":checked")){
            $(this).attr("checked", "checked");
            console.log("checked");
        } else {
            $(this).attr("checked", "");
            console.log("no checked");
        }
        
    });
    
    $("#consulta-matricula").submit(function(){
        var $toastContent;
        var todos = $("#listar-todos").attr("checked");
        var num = $("#matricula").val();
        var er = new RegExp("^[0-9]{10}$");
        var campo = num;
        console.log("numero digitado: " + campo);
        if (er.test(campo) || todos === "checked") {
            
            console.log("Passou na validação");  
            
        } else {
            
            $toastContent = $('<span>Por favor, digite uma matrícula válida <br> ou liste todos os alunos.</span>');
            Materialize.toast($toastContent, 3000);
            console.log("Por favor, digite uma matrícula válida."); 
            return false;
        }
        
   });  
}; 

var CarregaChart = function(param){
    $(".trigger").on("click", function(event) {
	$(".charts img").attr('src', "http://chart.apis.google.com/chart?cht=p3&chd=t:250,30,15,5&chs=450x200&chco=ff0000|8B7765|7B68EE|00FF00&chdl=250+Ubuntu|30+Slackware|15+Kurumin|5+Outros&chtt=Grafico+de+Distro|mais+utilizada&chl=Ubuntu|Slackware|Kurumin|Outros");
    });  
}; 

$(document).ready(function() {
    
    // Initialize collapse button
    $(".button-collapse").sideNav();
    
    $('.modal').modal();
    
    ValidaMatricula();
    CarregaChart();
 });

