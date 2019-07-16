
using PortalWeb.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Muñiz.Managers;
using TPC_Muñiz.Models;

namespace PortalWeb
{
    public partial class BandejaMesas : System.Web.UI.Page
    {
        MesasManager lista = new MesasManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            var cookie = Request.Cookies["session"];
            if (cookie == null)
            {
                Response.Redirect("Login.aspx", false);
            }
            BindingList<Mesas> pedido = lista.TraerMesas();

            pedido = lista.TraerMesas();
            ingredientes.DataSource = pedido;
            ingredientes.DataBind();
        }

        protected void showlist(object sender, EventArgs e)
        {
            Delete.Visible = false;
            Add.Visible = false;
            Mod.Visible = false;
            list.Visible = true;

            BindingList<Mesas> pedido = lista.TraerMesas();

            pedido = lista.TraerMesas();
            ingredientes.DataSource = pedido;
            ingredientes.DataBind();
        }

        protected void Showadd(object sender, EventArgs e)
        {
            Delete.Visible = false;
            Add.Visible = true;
            Mod.Visible = false;
            list.Visible = false;
            ddlnewingadd.Items.Add("SI");

            ddlnewingadd.Items.Add("NO");
        }

        protected void Showmod(object sender, EventArgs e)
        {
            Delete.Visible = false;
            Add.Visible = false;
            Mod.Visible = true;
            list.Visible = false;
            DataTable pedido = lista.TraerAperturas();

            pedido = lista.TraerAperturas();
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
                BindingList<Mesas> lista2 = lista.TraerMesas();
                ddlIng.DataSource = lista2;

                ddlIng.DataTextField = "Id";
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
                BindingList<Mesas> lista2 = lista.TraerMesas();
                ddlIng.DataSource = lista2;

                ddlIng.DataTextField = "Id";

                ddlIng.DataValueField = "Id";
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
                bool x = true;
                if(ddlnewingadd.SelectedItem.Text=="SI")
                {
                    x = true;
                }
                else
                {
                    x = false;
                }

                lista.AddNewstocks(int.Parse(newdesc.Value), x);
                newdesc.Value = "";
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


        protected void btnCancelcarga_ServerClick(object sender, EventArgs e)
        {
            
            pnlCargadiv.Visible = true;
            newdesc.Value = "";
            


        }
    }
}