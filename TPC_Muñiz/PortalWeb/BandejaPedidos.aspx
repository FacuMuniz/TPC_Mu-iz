<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BandejaPedidos.aspx.cs" Inherits="PortalWeb.BandejaPedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


   <asp:ScriptManager runat="server"></asp:ScriptManager>


      


          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" >
                <div class="form-inline justify-content-center mt-2">
                    <div class="form-group">
                        <label class="sr-only">Mesa</label>
                        <asp:TextBox CssClass="form-control" ID="txtmesa" runat="server" placeholder="Mesa"></asp:TextBox>
                    </div>
                   <div class="form-group">
                        <label class="sr-only">Fecha Desde</label>
                        <p>
                            <input type="text" autocomplete="off"  name="datepickerfrom" id="datepickerfrom" runat="server" class="mt-3 form-control" placeholder="Fecha Desde (DD/MM/AAAA)"></p>

                    </div>
                     <div class="form-group">
                        <label class="sr-only">Fecha Hasta</label>
                        <p>
                            <input type="text" autocomplete="off" name="datepickerto" id="datepickerto" runat="server" class="mt-3 form-control" placeholder="Fecha Hasta (DD/MM/AAAA)"></p>

                    </div>
                    <div class="btn-group ml-1" role="group" aria-label="Botones filtrar">
                        
                        <asp:Button ID="Button2" type="submit" runat="server" CssClass="btn btn-secondary" Text="Limpiar Filtros" OnClick="btnLimpiarFiltros_Click"></asp:Button>
                    </div>
                </div>
            </asp:Panel>

            <div class="ml-2">
                <div class="table-responsive">
                <asp:GridView ID="gvPedidos" runat="server" CssClass="mt-2" Font-Size="10pt" >
                  
                </asp:GridView>
                    </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function EnableTo() {
            if ($("[id$=datepickerfrom]").prop("value") == "")
            {
                $("[id$=datepickerto]").prop('value', "");
                $("[id$=datepickerto]").prop('disabled', true);
            }
            else
            {
                $("[id$=datepickerto]").prop('disabled', false);
            }

        }
</script>

     <script>
        function setupDatepickerfrom() {
            $("[id$=datepickerfrom]").datepicker({
                dateFormat: "dd-mm-yy"
            });
        }

        // Document ready
        $(function () {
            setupDatepickerfrom();
        });

        //On UpdatePanel Refresh
        var prm1 = Sys.WebForms.PageRequestManager.getInstance();
        if (prm1 != null) {
            prm1.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    setupDatepickerfrom();
                }
            });
        };
    </script>

    <script>
        function setupDatepicker() {
            $("[id$=datepickerto]").datepicker({
                dateFormat: "dd-mm-yy"
            });
        }

        // Document ready
        $(function () {
            setupDatepicker();
        });

        //On UpdatePanel Refresh
        var prm2 = Sys.WebForms.PageRequestManager.getInstance();
        if (prm2 != null) {
            prm2.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    setupDatepicker();
                }
            });
        };
    </script>

</asp:Content>
