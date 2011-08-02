// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var timeout    = 200;
var closetimer = 0;
var ddmenuitem = 0;

function jsddm_open()
{  jsddm_canceltimer();
   jsddm_close();
   ddmenuitem = $(this).find('ul').css('visibility', 'visible');}

function jsddm_close()
{  if(ddmenuitem) ddmenuitem.css('visibility', 'hidden');}

function jsddm_timer()
{  closetimer = window.setTimeout(jsddm_close, timeout);}

function jsddm_canceltimer()
{  if(closetimer)
   {  window.clearTimeout(closetimer);
      closetimer = null;}}

$(document).ready(function()
{

   $('#jsddm > li').bind('mouseover', jsddm_open);
   $('#jsddm > li').bind('mouseout',  jsddm_timer);
   $("#new_value").keypress(function(event){
     if (event.which == '13'){
      $("#new_value_button").click();
      return false;}});
    $('#accordion').accordion({active: false, alwaysOpen: false, collapsible: true, animated: 'slide'});
   }
   );

document.onclick = jsddm_close;

var values_count = 0;
var values_list = [];

function add_value(val){
  if (val == "" || val.length == 0 || val.match(","))
    return false;

  //check that new value not exists already
  for(index in values_list){
    if(val == values_list[index])
      return false;
  }

  $("#values_list").append("<li id='value-"+values_count+"' class='ui-corner-all'><div>"+val+"</div><a href='' onclick='remove_value("+values_count+"); return false;'>x</li>");
  $("#template_field_form").append("<input type='hidden' id='hidden-value-"+values_count+"' name='new_values[]' value='"+val+"' />");
  $("#new_value").attr('value', '');
  values_count++;
  values_list[values_list.length] = val;
}

function remove_value(index){
  values_list.splice(values_list.indexOf($("#value-"+index+" div")[0].innerHTML), 1);
  $("#value-"+index).remove();
  $("#hidden-value-"+index).remove();

}

var selected_column_names = new Array();

function remove_dinamic_field(link, col_name){
  $(link).parent().remove();
  selected_column_names.splice(selected_column_names.indexOf(col_name), 1);
  return false;
}

function add_field_to_template(elem, selected){
    var field = elem;

    if(selected_column_names.indexOf(field.tech_col_name) != -1)
      return false;
    else
      selected_column_names[selected_column_names.length] = field.tech_col_name;

    var select = "<select name='technique["+field.tech_col_name+"]'>";
    var values = field.values;
    select += "<option></option>";
    for(i = 0; i < values.length; i++){
      select += "<option id='"+values[i].id+"' ";

      if(values[i].value == selected)
        select += "selected='selected'";

      select += ">"+values[i].value+"</option>";
    }
    select += "</select>";


    $("#actions").before("<div class='field dinamic-field ui-corner-all'><label>"+field.name+" ("+field.tech_col_name+")</label><br />"+select+"<input type='hidden' value='"+field.id+"' name='technique_template[template_field_ids][]' /><a href='#' onclick='remove_dinamic_field(this, \""+field.tech_col_name+"\"); return false;'>x</a></div>");
}

