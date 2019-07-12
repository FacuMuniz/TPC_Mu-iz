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
    public partial class BandejaComidas : System.Web.UI.Page
    {
        
            UserManager lista = new UserManager();

        protected void Page_Load(object sender, EventArgs e)
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

                    ddlIng.DataTextField = "User";
                    ddlIng.DataValueField = "Id";
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
                    txtcant.Value = pedido[int.Parse(e.CommandArgument.ToString()) - 1].Tipo.ToString();
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

                
                    txtnewcant.Value = "";
                    txtnewdesc.Value = "";
                    txtnewprecio.Value = "";
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


                    BindingList<Usuario> pedido = lista.ListarStock();

                    pedido = lista.ListarStock();
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
                txtcant.Value = "";
            txtprecio.Value = "";


            }



        }
    }
