using PortalWeb.Managers;
using PortalWeb.Models;
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
    public partial class BandejaUsuarios : System.Web.UI.Page
    {

        UserManager lista = new UserManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindingList<Usuario> pedido = lista.ListarStock();

            pedido = lista.ListarStock();
            ingredientes.DataSource = pedido;
            ingredientes.DataBind();
        }

        protected void showlist(object sender, EventArgs e)
        {
            Delete.Visible = false;
            Add.Visible = false;
            Mod.Visible = false;
            list.Visible = true;

            BindingList<Usuario> pedido = lista.ListarStock();

            pedido = lista.ListarStock();
            ingredientes.DataSource = pedido;
            ingredientes.DataBind();
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
            BindingList<Usuario> pedido = lista.ListarStock();

            pedido = lista.ListarStock();
            ingredientes2.DataSource = pedido;
            ingredientes2.DataBind();

        }

        protected void Showdel(object sender, EventArgs e)
        {
            try
            {


                Delete.Visible = true;
                Add.Visible = false;
                Mod.Visible = false;
                list.Visible = false;
                BindingList<Usuario> lista2 = lista.ListarStock();
                ddlIng.DataSource = lista2;

                ddlIng.DataTextField = "User";
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

                
                lista.Delstocks(int.Parse(ddlIng.SelectedValue.ToString()));
                BindingList<Usuario> lista2 = lista.ListarStock();
                ddlIng.DataSource = lista2;

                ddlIng.DataTextField = "User";

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


                BindingList<Usuario> pedido = lista.ListarStock();

                iding.Value = e.CommandArgument.ToString();
                txtdescripcion.Value = pedido[int.Parse(e.CommandArgument.ToString()) - 1].User;
                ddltipo.SelectedValue = pedido[int.Parse(e.CommandArgument.ToString()) - 1].Tipo.ToString();
                txttipo.Value = pedido[int.Parse(e.CommandArgument.ToString()) - 1].Pass;
                Text2.Value = pedido[int.Parse(e.CommandArgument.ToString()) - 1].Nombre;
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


                BindingList<Usuario> pedido = lista.ListarStock();

                lista.modstocks(int.Parse(iding.Value), txtdescripcion.Value, int.Parse(ddltipo.SelectedValue.ToString()), txttipo.Value, Text2.Value);
                pnlCarga.Visible = false;
                pnlCargadiv.Visible = true;
                pedido = lista.ListarStock();

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


                lista.AddNewstocks(newdesc.Value, int.Parse(ddltipo.SelectedValue.ToString()), newtipo.Value, Text1.Value);
                newdesc.Value = "";
                newcant.Value = "";
                newtipo.Value = "";
                Text1.Value = "";
                Delete.Visible = false;
                Add.Visible = false;
                Mod.Visible = false;
                list.Visible = true;
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


                BindingList<Usuario> pedido = lista.ListarStock();

                pedido = lista.ListarStock();
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
            
            txttipo.Value = "";


        }



    }
}