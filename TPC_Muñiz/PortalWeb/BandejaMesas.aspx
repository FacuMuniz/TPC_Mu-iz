<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BandejaMesas.aspx.cs" Inherits="PortalWeb.BandejaMesas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="divSearchTask" runat="server" visible="true" class="d-flex justify-content-center mt-3 mb-3">
             <div class=" d-flex justify-content-center align-items-center">
                 <div id="searchtaskdiv">
                   <asp:LinkButton ID="ShowList" value="" runat="server" OnClick="showlist" ToolTip="Listar Mesas" Class="btn btn-success btn-circle2 fas fa-align-justify" style="font-size: xx-large"></asp:LinkButton>
                   <asp:LinkButton ID="Adding" value="" runat="server" OnClick="Showadd" ToolTip="Agregar Mesas" Class="btn btn-danger btn-circle2 fas fa-plus" style="font-size: xx-large"></asp:LinkButton>
                   <asp:LinkButton ID="Moding" value="" runat="server" OnClick="Showmod" ToolTip="Aperturas Mesas" Class="btn btn-success btn-circle2 fas fa-door-open" style="font-size: xx-large"></asp:LinkButton>
                   <asp:LinkButton ID="Deleteing" value="" runat="server" OnClick="Showdel" ToolTip="Borrar Mesas" Class="btn btn-danger btn-circle2 fas fa-trash-alt" style="font-size: xx-large"></asp:LinkButton>
                   
                  </div>
            </div>  
        </div>


    <asp:Panel id="list" runat="server">

            <asp:Panel ID="Panel1" runat="server" >
         
            </asp:Panel>

        <asp:Panel ID="pnlProyectos" CssClass="tblProyectos" runat="server">
            <table id="tblingrediente" class="tblProyectos">
                <thead>
                    <tr>
                           <th> id </th>

                        <th> Mesero </th>
                        
                        <th> Nombre </th>
                        
                        <th> salon </th>

                        <th> sillas </th>

                        
                        <th> habilitada </th>
                    </tr>
                </thead>
                <asp:Repeater runat="server" ID="ingredientes" >
                    <ItemTemplate >
                        <tr>
                            <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Id") %></label>
                            </td>
                            <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Mesero") %></label>
                            </td>
                            
                             <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Nombre") %></label>
                            </td>
                             <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Sillas") %></label>
                            </td>
                            <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Salon") %></label>
                            </td>
                            
                             <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Habilitada") %></label>
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
            <label class="sub-header">Carga de Datos</label>
        </div>
        <div class=" d-flex justify-content-center">
            <div class="d-flex flex-direction-column">
                
                <div class="input-container d-flex flex-direction-column">
             
                     <div class="d-flex justify-content-center">
                         <label class="header mr-4">Salon</label>
                        <input type="text" class=" mb-3" style="width:230px" placeholder="Salon" runat="server" id="newdesc" maxlength="30"/>
                        
                    </div>
                     <div class="d-flex justify-content-center">
                         <label class="header mr-4">Habilitada</label>
                        <asp:DropDownList ID="ddlnewingadd" runat="server" ></asp:DropDownList>
                        
                    </div>
                     <div class="d-flex justify-content-center">
                 
                   
                    <div class="d-flex justify-content-center">
                        <input type="button" class="auth-btn mt-4 mr-5" value="Aceptar" runat="server" id="btnNewIng" onserverclick="btnnuevaCarga_ServerClick"/>
                        <input type="button" class="auth-btn mt-4 ml-5" value="Cancelar" runat="server" id="btncancelNew" onserverclick="btnCancelcarga_ServerClick"/>
                    </div>

                      <div class="d-flex justify-content-center">
                        <asp:label class="sub-header" runat="server" Visible="false" ID="Label1"> DATOS INVALIDOS, VERIFIQUE LOS CAMPOS ANTES DE CONTINUAR </asp:label>
                    </div>
                    
                </div>
            </div>
        </div>
    

    </asp:Panel>

    <asp:Panel id="Mod" runat="server" Visible="false">

             

        <asp:Panel ID="pnlCargadiv" CssClass="tblProyectos" runat="server">
            <table id="tblingrediente2" class="tblProyectos">
                <thead>
                    <tr>
                        <th> id </th>

                        <th> Mesero </th>
                        
                        <th> Mesa </th>
                        
                        <th> Hora Inicio </th>

                        <th> Hora Fin </th>

                        <th> Monto Facturado </th>

                        <th> Ver Pedidos </th>
                    </tr>
                </thead>
                <asp:Repeater runat="server" ID="ingredientes2" OnItemCommand="MostrarPedidos" >
                    <ItemTemplate >
                        <tr>
                            <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("id") %></label>
                            </td>
                            <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Nombre") %></label>
                            </td>
                             <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("idmesa") %></label>
                            </td>
                            <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("horainicio") %></label>
                            </td>
                             <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("horafin") %></label>
                            </td>
                             <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("MontoFacturado") %></label>
                            </td>
                             <td class="tblProyectos">
                                 
                                <asp:LinkButton ID="btnModificar" value="" runat="server" CommandArgument='<%# Eval("idmesa") %>' CommandName='<%#Eval("horainicio")+","+ Eval("horafin")%>' OnClientClick="startUpdate" Class="btn btn-success fas fa-eye m-3"></i></asp:LinkButton>
                            </td>
                            
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </asp:Panel>

    </asp:Panel>

     <asp:Panel ID="Panel2" CssClass="tblProyectos" runat="server" Visible="false">
            <table id="tblingrediente" class="tblProyectos">
                <thead>
                    <tr>
                        <th> id </th>

                        <th> Idmesero </th>
                        
                        <th> Idmesa </th>
                        
                        <th> Idcomida </th>
                        
                        <th> Descripcion </th>
                        
                        <th> Hora </th>
                        
                        <th> Precio </th>
                        
                    </tr>
                </thead>
                <asp:Repeater runat="server" ID="rptMesas" >
                    <ItemTemplate >
                        <tr>
                            <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Id") %></label>
                            </td>
                            <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Idmesero") %></label>
                            </td>
                             <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Idmesa") %></label>
                            </td>
                             <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Idcomida") %></label>
                            </td>
                             <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Descripcion") %></label>
                            </td>
                             <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Hora") %></label>
                            </td>
                             <td class="tblProyectos">
                                <label class="list-projects tblProyectos"><%#Eval("Precio") %></label>
                            </td>
                       
                           
                            
                            
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
         <div class="d-flex justify-content-center">
             <asp:LinkButton ID="LinkButton1" value="" runat="server" OnClick="btnvolver_ServerClick" ToolTip="Volver" Class="btn btn-danger btn-circle2 fas fa-arrow-left" style="font-size: xx-large"></asp:LinkButton>
                         
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
