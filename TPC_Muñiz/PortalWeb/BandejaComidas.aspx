<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BandejaComidas.aspx.cs" Inherits="PortalWeb.BandejaComidas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:HiddenField id="idcom" runat="server" value=""/>

     <div id="divSearchTask" runat="server" visible="true" class="d-flex justify-content-center mt-3 mb-3">
             <div class=" d-flex justify-content-center align-items-center">
                 <div id="searchtaskdiv">
                   <asp:LinkButton ID="ShowList" value="" runat="server" OnClick="showlist" ToolTip="Listar ingredientes" Class="btn btn-success btn-circle2 fas fa-align-justify" style="font-size: xx-large"></asp:LinkButton>
                   <asp:LinkButton ID="Adding" value="" runat="server" OnClick="Showadd" ToolTip="Agregar ingredientes" Class="btn btn-danger btn-circle2 fas fa-plus" style="font-size: xx-large"></asp:LinkButton>
                   <asp:LinkButton ID="Moding" value="" runat="server" OnClick="Showmod" ToolTip="Modificar ingredientes" Class="btn btn-success btn-circle2 fas fa-pen" style="font-size: xx-large"></asp:LinkButton>
                   <asp:LinkButton ID="Deleteing" value="" runat="server" OnClick="Showdel" ToolTip="Borrar ingredientes" Class="btn btn-danger btn-circle2 fas fa-trash-alt" style="font-size: xx-large"></asp:LinkButton>
                   
                  </div>
            </div>  
        </div>

    <asp:Panel id="list" runat="server">

            <asp:Panel ID="Panel1" runat="server" >
                <div class="form-inline justify-content-center mt-2">
                 
                </div>
            </asp:Panel>

        <asp:Panel ID="pnlProyectos" CssClass="tblProyectos" runat="server">
            <table id="tblingrediente" class="tblProyectos">
                <thead>
                    <tr>
                           <th> id </th>

                        <th> Descripcion </th>
                        
                        <th> Precio </th>
                        
                    </tr>
                </thead>
                <asp:Repeater runat="server" ID="ingredientes" >
                    <ItemTemplate >
                        <tr>
                            <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Id") %></label>
                            </td>
                            <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Descripcion") %></label>
                            </td>
                             <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Precio") %></label>
                            </td>
                            
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </asp:Panel>

    </asp:Panel>


        

    <asp:HiddenField ID="iding" runat="server" Value="0"/>

            

    <asp:Panel id="Add" runat="server" Visible="false">

         <div class="header-container d-flex flex-direction-column">
            <label class="header">Ingredientes</label>
            <label class="sub-header">Modificar de Datos</label>
        </div>
        <div class=" d-flex justify-content-center">
            <div class="d-flex flex-direction-column">
                
                <div class="input-container d-flex flex-direction-column">
             
                     <div class="d-flex justify-content-center">
                         <label class="header mr-4">Descripcion</label>
                        <input type="text" class=" mb-3" style="width:230px" placeholder="Descripcion" runat="server" id="txtnewdesc" maxlength="30"/>
                        
                    </div>
                     <div class="d-flex justify-content-center">
                         <label class="header mr-5">Precio</label>
                        <input type="text" class=" mb-3" style="width:230px" placeholder="Precio" runat="server" id="txtnewprecio" maxlength="30"/>
                        
                    </div>
                     <div class="d-flex justify-content-center">
                         <label class="header mr-4">Ingrediente</label>
                        <asp:DropDownList ID="ddlnewingadd" runat="server" ></asp:DropDownList>
                        
                    </div>
                     <div class="d-flex justify-content-center">
                         <label class="header mr-4"> Cantidad</label>
                        <input type="text" class=" mb-3"  style="width:230px" placeholder="Nombre" runat="server" id="txtnewcant" maxlength="10"/>
                        
                    </div>
                    <div>

                        <div>
                            <input type="button" class="auth-btn mt-4 mr-5" value="Aceptar" runat="server" id="Button3" onserverclick="btnAgregarIng_ServerClick"/>
                            <asp:Repeater runat="server" ID="rptaddcomida" OnItemCommand="rpt_ItemCommandadd">
                    <ItemTemplate>
                        <div class="row mb-1 ml-1">
                            <div class="col col-4">
                                <label class="list-projects"><%#Eval("Descripcion") %></label>
                            </div>
                            <div class="col col-4 right-column">
                                
                                <label class="list-projects"><%#Eval("Cantidad") %></label>
                            </div>
                             <div class="col col-4 right-column">
                                <asp:LinkButton ID="btnEliminar"  runat="server"  CommandArgument='<%# Eval("Id") %>' data-toggle="tooltip" data-placement="right" title="Remover Ingrediente" OnClientClick="postponePostback(this, event, showDeleteConfirmationtask, true)"  class="btn btn-circle btn-danger btn-stop ml-1"><i class="fas fa-times"></i></asp:LinkButton>

                            </div>
                        
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                        </div>
                    </div>
                     <div class="d-flex justify-content-center">
              
                   
                    <div class="d-flex justify-content-center">
                        <input type="button" class="auth-btn mt-4 mr-5" value="Aceptar" runat="server" id="Button4" onserverclick="btnAceptarnuevaCarga_ServerClick"/>
                        <input type="button" class="auth-btn mt-4 ml-5" value="Cancelar" runat="server" id="Button5" onserverclick="btnCancelcarga_ServerClick"/>
                    </div>

                      <div class="d-flex justify-content-center">
                        <asp:label class="sub-header" runat="server" Visible="false" ID="Label1"> DATOS INVALIDOS, VERIFIQUE LOS CAMPOS ANTES DE CONTINUAR </asp:label>
                    </div>
                    
                </div>
            </div>
        </div>

    </asp:Panel>

    <asp:Panel id="Mod" runat="server" Visible="false">

               <asp:Panel ID="Panel2" runat="server" >
                <div class="form-inline justify-content-center mt-2">
                  
                </div>
            </asp:Panel>

        <asp:Panel ID="pnlCargadiv" CssClass="tblProyectos" runat="server">
            <table id="tblingrediente2" class="tblProyectos">
                <thead>
                    <tr>
                        <th> id </th>

                        <th> Descripcion </th>
                        
                        <th> Precio </th>

                        <th> Modificar </th>
                        
                    </tr>
                </thead>
                <asp:Repeater runat="server" ID="ingredientes2" OnItemCommand="startUpdate" >
                    <ItemTemplate >
                        <tr>
                            <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Id") %></label>
                            </td>
                            <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Descripcion") %></label>
                            </td>
                             <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Precio") %></label>
                            </td>
                       
                           
                             <td class="tblProyectos">
                                 
                                <asp:LinkButton ID="btnModificar" value="" runat="server" CommandArgument='<%# Eval("Itemid") %>' OnClientClick="startUpdate" Class="btn btn-success fas fa-cloud-download-alt m-3"></i></asp:LinkButton>
                            </td>
                            
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </asp:Panel>

    </asp:Panel>

    
         <asp:Panel id="pnlCarga" runat="server" visible="false">
        <div class="header-container d-flex flex-direction-column">
            <label class="header">Ingredientes</label>
            <label class="sub-header">Modificar de Datos</label>
        </div>
        <div class=" d-flex justify-content-center">
            <div class="d-flex flex-direction-column">
                
                <div class="input-container d-flex flex-direction-column">
             
                     <div class="d-flex justify-content-center">
                         <label class="header mr-4">Descripcion</label>
                        <input type="text" class=" mb-3" style="width:230px" placeholder="Descripcion" runat="server" id="txtdescripcion" maxlength="30"/>
                        
                    </div>
                     <div class="d-flex justify-content-center">
                         <label class="header mr-5">Precio</label>
                        <input type="text" class=" mb-3" style="width:230px" placeholder="Precio" runat="server" id="txtprecio" maxlength="30"/>
                        
                    </div>
                     <div class="d-flex justify-content-center">
                         <label class="header mr-4">Ingrediente</label>
                        <asp:DropDownList ID="ddlIngredientes" runat="server" ></asp:DropDownList>
                        
                    </div>
                     <div class="d-flex justify-content-center">
                         <label class="header mr-4"> Cantidad</label>
                        <input type="text" class=" mb-3"  style="width:230px" placeholder="Nombre" runat="server" id="txtcant" maxlength="10"/>
                        
                    </div>
                    <div>

                        <div>
                            <input type="button" class="auth-btn mt-4 mr-5" value="Agregar ingrediente" runat="server" id="AgregarIng" onserverclick="btnAgregarIng_ServerClick"/>
                            <asp:Repeater runat="server" ID="rptIngredientes" OnItemCommand="rpt_ItemCommand">
                    <ItemTemplate>
                        <div class="row mb-1 ml-1">
                            <div class="col col-4">
                                <label class="list-projects"><%#Eval("Descripcion") %></label>
                            </div>
                            <div class="col col-4 right-column">
                                
                                <label class="list-projects"><%#Eval("Cantidad") %></label>
                            </div>
                             <div class="col col-4 right-column">
                                <asp:LinkButton ID="btnEliminar"  runat="server"  CommandArgument='<%# Eval("Id") %>' data-toggle="tooltip" data-placement="right" title="Remover Ingrediente" OnClientClick="postponePostback(this, event, showDeleteConfirmationtask, true)"  class="btn btn-circle btn-danger btn-stop ml-1"><i class="fas fa-times"></i></asp:LinkButton>

                            </div>
                        
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                        </div>
                    </div>
                     <div class="d-flex justify-content-center">
              
                   
                    <div class="d-flex justify-content-center">
                        <input type="button" class="auth-btn mt-4 mr-5" value="Aceptar" runat="server" id="btnAceptarCarga" onserverclick="btnAceptarCarga_ServerClick"/>
                        <input type="button" class="auth-btn mt-4 ml-5" value="Cancelar" runat="server" id="btnCancelarcarga" onserverclick="btnCancelcarga_ServerClick"/>
                    </div>

                      <div class="d-flex justify-content-center">
                        <asp:label class="sub-header" runat="server" Visible="false" ID="lblfail"> DATOS INVALIDOS, VERIFIQUE LOS CAMPOS ANTES DE CONTINUAR </asp:label>
                    </div>
                    
                </div>
            </div>
        </div>
    </asp:Panel>





    <asp:Panel id="Delete" runat="server" Visible="false">

         <div class="header-container d-flex flex-direction-column">
            <label class="header">Ingredientes</label>
            <label class="sub-header">Carga de Datos</label>
        </div>
        <div class=" d-flex justify-content-center">
            <div class="d-flex flex-direction-column">
                
                <div class="input-container d-flex flex-direction-column">
             
                    <asp:DropDownList ID="ddlIng" runat="server">
                    </asp:DropDownList>
                    <div class="d-flex justify-content-center">
                        <input type="button" class="auth-btn mt-4 mr-5" value="Eliminar" runat="server" id="btndel" onserverclick="btnBorrar_ServerClick"/>
                    </div>
                    
                </div>
            </div>
        </div>

    </asp:Panel>






     <script type="text/javascript">
        $(document).ready(function () {
            $('#tblingrediente').dataTable({
                "language": {
                    "sProcessing": "Procesando...",
                    "sLengthMenu": "Mostrar _MENU_ registros",
                    "sZeroRecords": "No se encontraron resultados",
                    "sEmptyTable": "Ningún dato disponible en esta tabla",
                    "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                    "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "sInfoPostFix": "",
                    "sSearch": "Buscar:",
                    "sUrl": "",
                    "sInfoThousands": ",",
                    "sLoadingRecords": "Cargando...",
                    "oPaginate": {
                        "sFirst": "Primero",
                        "sLast": "Último",
                        "sNext": "Siguiente",
                        "sPrevious": "Anterior"
                    },
                    "oAria": {
                        "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                    }
                }
            });
        });
</script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#tblingrediente2').dataTable({
                "language": {
                    "sProcessing": "Procesando...",
                    "sLengthMenu": "Mostrar _MENU_ registros",
                    "sZeroRecords": "No se encontraron resultados",
                    "sEmptyTable": "Ningún dato disponible en esta tabla",
                    "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                    "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "sInfoPostFix": "",
                    "sSearch": "Buscar:",
                    "sUrl": "",
                    "sInfoThousands": ",",
                    "sLoadingRecords": "Cargando...",
                    "oPaginate": {
                        "sFirst": "Primero",
                        "sLast": "Último",
                        "sNext": "Siguiente",
                        "sPrevious": "Anterior"
                    },
                    "oAria": {
                        "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                    }
                }
            });
        });
</script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#tblingrediente3').dataTable({
                "language": {
                    "sProcessing": "Procesando...",
                    "sLengthMenu": "Mostrar _MENU_ registros",
                    "sZeroRecords": "No se encontraron resultados",
                    "sEmptyTable": "Ningún dato disponible en esta tabla",
                    "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                    "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "sInfoPostFix": "",
                    "sSearch": "Buscar:",
                    "sUrl": "",
                    "sInfoThousands": ",",
                    "sLoadingRecords": "Cargando...",
                    "oPaginate": {
                        "sFirst": "Primero",
                        "sLast": "Último",
                        "sNext": "Siguiente",
                        "sPrevious": "Anterior"
                    },
                    "oAria": {
                        "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                    }
                }
            });
        });
</script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#tblingrediente4').dataTable({
                "language": {
                    "sProcessing": "Procesando...",
                    "sLengthMenu": "Mostrar _MENU_ registros",
                    "sZeroRecords": "No se encontraron resultados",
                    "sEmptyTable": "Ningún dato disponible en esta tabla",
                    "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                    "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "sInfoPostFix": "",
                    "sSearch": "Buscar:",
                    "sUrl": "",
                    "sInfoThousands": ",",
                    "sLoadingRecords": "Cargando...",
                    "oPaginate": {
                        "sFirst": "Primero",
                        "sLast": "Último",
                        "sNext": "Siguiente",
                        "sPrevious": "Anterior"
                    },
                    "oAria": {
                        "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                    }
                }
            });
        });
</script>

</asp:Content>
