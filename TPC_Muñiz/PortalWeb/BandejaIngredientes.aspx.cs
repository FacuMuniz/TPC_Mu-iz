using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Muñiz.Managers;
using TPC_Muñiz.Models;

namespace PortalWeb
{
    public partial class BandejaIngredientes : System.Web.UI.Page
    {

        StockManager lista = new StockManager();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            var cookie = Request.Cookies["session"];
            if (cookie == null)
            {
                Response.Redirect("Login.aspx", false);
            }
        }

        protected void showlist(object sender, EventArgs e)
        {
            Delete.Visible = false;
            Add.Visible = false;
            Mod.Visible = false;
            list.Visible = true;
        }

        protected void Showadd(object sender, EventArgs e)
        {
            Delete.Visible = false;
            Add.Visible = true;
            Mod.Visible = false;
            list.Visible = false;
        }

        protected void Showmod(object sender, EventArgs e)
        {
            Delete.Visible = false;
            Add.Visible = false;
            Mod.Visible = true;
            list.Visible = false;
          
        }

        protected void Showdel(object sender, EventArgs e)
        {
            try
            {


                Delete.Visible = true;
                Add.Visible = false;
                Mod.Visible = false;
                list.Visible = false;
                StockManager stock = new StockManager();
                BindingList<Ingrediente> lista = stock.ListarStock("");
                ddlIng.DataSource = lista;

                ddlIng.DataTextField = "Descripcion";
                ddlIng.DataValueField = "Id";
                ddlIng.DataBind();
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }
        }

        protected void btnBorrar_ServerClick(object sender, EventArgs e)
        {
            try
            {


                StockManager stock = new StockManager();
                stock.Delstocks(int.Parse(ddlIng.SelectedValue.ToString()));
                BindingList<Ingrediente> lista = stock.ListarStock("");
                ddlIng.DataSource = lista;

                ddlIng.DataTextField = "Descripcion";
                ddlIng.DataValueField = "Id";
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }

        }

        protected void startUpdate(object sender, RepeaterCommandEventArgs e)
        {
            try
            {


                BindingList<Ingrediente> pedido = lista.ListarStock(txtmesa.Text.ToString());

                iding.Value = e.CommandArgument.ToString();
                txtdescripcion.Value = pedido[int.Parse(e.CommandArgument.ToString()) - 1].Descripcion;
                txtcant.Value = pedido[int.Parse(e.CommandArgument.ToString()) - 1].Cantidad.ToString();
                txttipo.Value = pedido[int.Parse(e.CommandArgument.ToString()) - 1].Tipocant;
                pnlCargadiv.Visible = false;
                pnlCarga.Visible = true;
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }
        }

        protected void btnAceptarCarga_ServerClick(object sender, EventArgs e)
        {
            try
            {


                BindingList<Ingrediente> pedido = lista.ListarStock(txtmesa.Text.ToString());

                lista.modstocks(int.Parse(iding.Value), txtdescripcion.Value, float.Parse(txtcant.Value), txttipo.Value);
                pnlCarga.Visible = false;
                pnlCargadiv.Visible = true;
                pedido = lista.ListarStock(txtmesa.Text.ToString());

                ingredientes2.DataSource = pedido;
                ingredientes2.DataBind();
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }
        }

        protected void btnnuevaCarga_ServerClick(object sender, EventArgs e)
        {
            try
            {



                lista.AddNewstocks(newdesc.Value, int.Parse(newcant.Value), newtipo.Value);
                newdesc.Value = "";
                newcant.Value = "";
                newtipo.Value = "";
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }

        }


        protected void btnLimpiarFiltros_Click(object sender, EventArgs e)
        {
            try
            {


                BindingList<Ingrediente> pedido = lista.ListarStock(txtmesa.Text.ToString());

                pedido = lista.ListarStock(txtmesa.Text.ToString());
                ingredientes.DataSource = pedido;
                ingredientes.DataBind();
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }

        }

        protected void btnListMod_Click(object sender, EventArgs e)
        {
            try
            {


                BindingList<Ingrediente> pedido = lista.ListarStock(txtmesa.Text.ToString());

                pedido = lista.ListarStock(txtmesa.Text.ToString());
                ingredientes2.DataSource = pedido;
                ingredientes2.DataBind();
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }

        }

        protected void btnCancelcarga_ServerClick(object sender, EventArgs e)
        {

            pnlCarga.Visible = false;
            pnlCargadiv.Visible = true;
            txtdescripcion.Value = "";
            txtcant.Value = "";
            txttipo.Value = "";


        }

     

    }
}