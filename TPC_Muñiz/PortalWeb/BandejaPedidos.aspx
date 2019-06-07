<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BandejaPedidos.aspx.cs" Inherits="PortalWeb.BandejaPedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:UpdatePanel ID="upBandejaHojasDeRuta_Filtrar" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlFiltrarHojasDeRuta" runat="server" DefaultButton="btnFiltrar">
                <div class="form-inline justify-content-center mt-2">
                    <div class="form-group">
                        <label class="sr-only">Hoja de Ruta</label>
                        <asp:TextBox CssClass="form-control" ID="txtHojaDeRuta" runat="server" placeholder="Hoja de Ruta"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="sr-only">Fecha</label>
                        <p>
                            <input type="text" autocomplete="off" id="datepicker" runat="server" class="mt-3 form-control" placeholder="Fecha (DD/MM/AAAA)"></p>

                    </div>
                    <div class="btn-group ml-1" role="group" aria-label="Botones filtrar">
                        <asp:Button ID="btnFiltrar" type="submit" runat="server" CssClass="btn btn-blue" Text="Filtrar" OnClick="btnFiltrar_Click"></asp:Button>
                        <asp:Button ID="btnLimpiarFiltros" type="submit" runat="server" CssClass="btn btn-secondary" Text="Limpiar Filtros" OnClick="btnLimpiarFiltros_Click"></asp:Button>
                    </div>
                </div>
            </asp:Panel>

          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnFiltrar">
                <div class="form-inline justify-content-center mt-2">
                    <div class="form-group">
                        <label class="sr-only">Mesa</label>
                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Mesa"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="sr-only">Fecha</label>
                        <p>
                            <input type="text" autocomplete="off" id="Text1" runat="server" class="mt-3 form-control" placeholder="Fecha (DD/MM/AAAA)"></p>

                    </div>
                    <div class="btn-group ml-1" role="group" aria-label="Botones filtrar">
                        <asp:Button ID="Button1" type="submit" runat="server" CssClass="btn btn-blue" Text="Filtrar" OnClick="btnFiltrar_Click"></asp:Button>
                        <asp:Button ID="Button2" type="submit" runat="server" CssClass="btn btn-secondary" Text="Limpiar Filtros" OnClick="btnLimpiarFiltros_Click"></asp:Button>
                    </div>
                </div>
            </asp:Panel>

            <div class="ml-2">
                <div class="table-responsive">
              <%--  <asp:GridView ID="gvHojasDeRuta" runat="server" CssClass="mt-2" Font-Size="10pt" OnSorting="GridView_Sorting" OnRowDataBound="GridView_RowDataBound" OnPageIndexChanging="GridView_PageIndexChanging">
                  
                </asp:GridView>--%>
                    </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

        </ContentTemplate>
    </asp:UpdatePanel>



</asp:Content>
