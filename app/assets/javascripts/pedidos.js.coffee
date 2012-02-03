jQuery ->
  $("#pedido_fechaevento").datepicker({dateFormat: 'dd/mm/yy'})
  $("#pedido_fechacumple").datepicker({dateFormat: 'dd/mm/yy'})
  $("#pedido_fechaentrega").datepicker({dateFormat: 'dd/mm/yy'})
  $("#ui-datepicker-div").css("display", "none")


  $("#pedido_evento_id").change ->
    pedido = $('#pedido_evento_id :selected').text()
    if pedido.indexOf("Cumple") > -1
      $("#divCumple").css("display", "")
      $("#divCumple2").css("display", "")

    else
      $("#divCumple").css("display", "none")
      $("#divCumple2").css("display", "none")

  sitios = $('#pedido_sitio_entrega_id').html()
  $('#pedido_forma_entrega_id').change ->
    forma = $('#pedido_forma_entrega_id :selected').text()

    if forma.indexOf("personalmente") > -1
      $('#divSitio').css("display","")
      $('#divDatosEntrega').css("display","none")
    else
      $('#divSitio').css("display","none")
      $('#divDatosEntrega').css("display","")

