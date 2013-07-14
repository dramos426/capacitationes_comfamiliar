// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(function() {
  
  setTimeout(function hideFlash(){ $('.alert').slideUp('slow');}, 8000);

  $.datepicker.setDefaults($.datepicker.regional["es"]);
  $('#datepicker').datepicker({
    numberOfMonths: 3,
    showButtonPanel: true,
    dateFormat: "yy-mm-dd"
  });


  $('#capacitacion_valor_base').change(function(){
    var valor_base = $('#capacitacion_valor_base').val();
    if ( valor_base != "") {
      cat_a = (valor_base*0.5);
      cat_b = (valor_base*0.7);
      cat_c = (valor_base*0.9);
      cat_d = (valor_base*1);
      $('#capacitacion_valor_cat_a').val(cat_a);
      $('#capacitacion_valor_cat_b').val(cat_b);
      $('#capacitacion_valor_cat_c').val(cat_c);
      $('#capacitacion_valor_cat_d').val(cat_d);
    }
  });

  $('#find_user').click(function(){
    addUser();
  });

  $('#add_user').click(function(){
    slide(this);
  });

  $('#add_new_user').click(function(e){
    e.preventDefault();
    if ($('#usuario_identificacion').val() ==""){
      alert("Debe digitar una identifiación para el usuario");
      $('#usuario_identificacion').focus();
      return;
    }
    if ($('#usuario_nombres').val() ==""){
      alert("Debe digitar un nombre para el usuario");
      $('#usuario_nombres').focus();
      return;
    }
    if ($('#usuario_apellidos').val() ==""){
      alert("Debe digitar un apellido para el usuario");
      $('#usuario_apellidos').focus()
      return;
    }
    $('#new_user').submit();
  });

  $('#identification_search').keypress(function(k){
    if (k.keyCode != 13) {return}
    addUser();
  });
});

var status = true;
function slide(sel){
  if (status == "true") {
    $('#form_user').slideDown();
    $(sel).text("Ocultar Formulario ");
    var etq_i = $("<i>");
    etq_i.addClass("icon-chevron-up");
    $(sel).append(etq_i);
    status = false;
  } else {
    $('#form_user').slideUp();
    var etq_i = $("<i>");
    etq_i.addClass("icon-chevron-down");
    $(sel).text("Agregar Usuario ").append(etq_i);
    status = true;
  }
}

function addUser(){
  $.ajax({
    url: '/usuarios/search_user',
    data: {
      user_identificacion: $('#identification_search').val(),
      capacitacion_id: $('#capacitacion_id').val()
    }
  });
}