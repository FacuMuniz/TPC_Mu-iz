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
      
        PedidosManager lista = new PedidosManager();
        BindingList<Item> listingredientes = new BindingList<Item>();
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            var cookie = Request.Cookies["session"];
            if (cookie == null)
            {
                Response.Redirect("Login.aspx", false);
            }
            if (!IsPostBack)
               {

                id = 0;
                Delete.Visible = false;
                Add.Visible = false;
                Mod.Visible = false;
                list.Visible = true;
                BindingList<Comida> pedido = lista.TraerComidas();

                ingredientes.DataSource = pedido;
                ingredientes.DataBind();
            }
          
        
        }

        protected void showlist(object sender, EventArgs e)
        {
            Delete.Visible = false;
            Add.Visible = false;
            Mod.Visible = false;
            list.Visible = true;
            BindingList<Comida> pedido = lista.TraerComidas();

            ingredientes.DataSource = pedido;
            ingredientes.DataBind();
        }

        protected void Showadd(object sender, EventArgs e)
        {
            Delete.Visible = false;
            Add.Visible = true;
            Mod.Visible = false;
            list.Visible = false;

            StockManager cargar = new StockManager();
            BindingList<Ingrediente> ingredientes2 = cargar.ListarStock("");
            ddlnewingadd.DataSource = ingredientes2;

            ddlnewingadd.DataTextField = "Descripcion";

            ddlnewingadd.DataValueField = "Id";

            ddlnewingadd.DataBind();
            rptaddcomida.DataSource = null;
            rptaddcomida.DataBind();
        }

        protected void Showmod(object sender, EventArgs e)
        {
            int x = 0;

            Delete.Visible = false;
            Add.Visible = false;
            Mod.Visible = true;
            list.Visible = false;
            BindingList<Comida> pedido = lista.TraerComidas();
            foreach (Comida item in pedido)
            {
                pedido[x].Itemid = x;
                x++;

            }
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
                PedidosManager stock = new PedidosManager();
                BindingList<Comida> lista = stock.TraerComidas();
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


                PedidosManager stock = new PedidosManager();
                stock.DelComida(int.Parse(ddlIng.SelectedValue.ToString()));
                stock.DelallCxi(int.Parse(ddlIng.SelectedValue.ToString()));
                BindingList<Comida> lista = stock.TraerComidas();
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

        protected void startUpdate(object sender, RepeaterCommandEventArgs e)
        {
            try
            {
                int x = 0;
                id = int.Parse(e.CommandArgument.ToString());
                StockManager cargar = new StockManager();
                List<string> tipos = new List<string>();
                BindingList<Ingrediente> ingredientes2 = cargar.ListarStock("");
                BindingList<Comida> pedido = lista.TraerComidas();
                listingredientes = lista.TraerCxi(int.Parse(e.CommandArgument.ToString()));
                ddlIngredientes.DataSource = ingredientes2;
               
                ddlIngredientes.DataTextField = "Descripcion";

                ddlIngredientes.DataValueField = "Id";

                ddlIngredientes.DataBind();
                for ( x = 0; x < ingredientes2.Count(); x++)
                {
                    tipos.Add(ingredientes2[x].Tipocant);
                }
                iding.Value = e.CommandArgument.ToString();
                txtdescripcion.Value = pedido[int.Parse(e.CommandArgument.ToString()) - 1].Descripcion;
                txtprecio.Value = pedido[int.Parse(e.CommandArgument.ToString())].Precio.ToString();
                rptIngredientes.DataSource = listingredientes;
                rptIngredientes.DataBind();
                pnlCargadiv.Visible = false;
                pnlCarga.Visible = true;
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }
        }



        protected void btnAgregarIng_ServerClick(object sender, EventArgs e)
        {
            try
            {
                listingredientes = lista.Traeraux();

                StockManager cargar = new StockManager();
                List<string> tipos = new List<string>();
                BindingList<Ingrediente> ingredientes2 = cargar.ListarStock("");
                for (int x = 0; x < ingredientes2.Count(); x++)
                {
                    tipos.Add(ingredientes2[x].Tipocant);
                }
                BindingList<Comida> pedido = lista.TraerComidas();
                Item data = new Item();
                if(txtcant.Value=="")
                {
                    data.Id = int.Parse(ddlnewingadd.SelectedValue.ToString());
                    data.Descripcion = ddlnewingadd.SelectedItem.Text;
                    data.Cantidad = float.Parse(txtnewcant.Value.ToString());
                    data.tipo = tipos[int.Parse(ddlnewingadd.SelectedValue.ToString()) - 1];
                    listingredientes.Add(data);

                    foreach (Item item in listingredientes)
                    {
                        
                        lista.cargaaux(item.Id, item.Descripcion, item.Cantidad, item.tipo);

                    }


                    if (id == 0)
                    { }
                    else
                    {

                        lista.AddNewcxi(int.Parse(ddlnewingadd.SelectedValue), float.Parse(txtcant.Value.ToString()), id, data.tipo);
                    }

                    pnlCarga.Visible = false;
                    pnlCargadiv.Visible = true;
                    rptaddcomida.DataSource = listingredientes;
                    rptaddcomida.DataBind();
                }
                else
                {
                    data.Id = int.Parse(ddlIngredientes.SelectedValue.ToString());
                    data.Descripcion = ddlIngredientes.SelectedItem.Text;
                    data.Cantidad = float.Parse(txtcant.Value.ToString());
                    data.tipo = tipos[int.Parse(ddlIngredientes.SelectedValue.ToString()) - 1];
                    listingredientes.Add(data);

                    foreach (Item item in listingredientes)
                    {
                        lista.cargaaux(item.Id, item.Descripcion, item.Cantidad, item.tipo);

                    }


                    if (id == 0)
                    { }
                    else
                    {

                        lista.AddNewcxi(int.Parse(ddlnewingadd.SelectedValue), float.Parse(txtcant.Value.ToString()), id, data.tipo);
                    }

                    pnlCarga.Visible = false;
                    pnlCargadiv.Visible = true;
                    rptIngredientes.DataSource = listingredientes;
                    rptIngredientes.DataBind();
                }
               

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
                listingredientes = lista.Traeraux();

                BindingList<Comida> pedido = lista.TraerComidas();
                lista.modComida(id,txtdescripcion.Value, float.Parse(txtprecio.Value));
                foreach(Item item in listingredientes)
                {

                    lista.AddNewcxi(item.Id, float.Parse(txtcant.Value.ToString()), id, item.tipo);
                }

                pnlCarga.Visible = false;
                pnlCargadiv.Visible = true;
                pedido = lista.TraerComidas();

                ingredientes2.DataSource = pedido;
                ingredientes2.DataBind();
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }
        }

        protected void btnAceptarnuevaCarga_ServerClick(object sender, EventArgs e)
        {
            try
            {
                listingredientes = lista.Traeraux();

                BindingList<Comida> pedido = lista.TraerComidas();
                id = lista.AddNewcomida(txtnewdesc.Value, float.Parse(txtnewprecio.Value));
                foreach (Item item in listingredientes)
                {

                    lista.AddNewcxi(item.Id, float.Parse(txtnewcant.Value.ToString()), id,item.tipo);
                }

                pnlCarga.Visible = false;
                pnlCargadiv.Visible = true;
                pedido = lista.TraerComidas();

                ingredientes2.DataSource = pedido;
                ingredientes2.DataBind();
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }

        }

        protected void rpt_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            
            listingredientes = lista.TraerCxi(int.Parse(e.CommandArgument.ToString()));
            int index = 0;
            for (int x = 0; x < listingredientes.Count(); x++)
            {
                if (int.Parse(e.CommandArgument.ToString()) == listingredientes[x].Id)
                {
                    index = x;
                }
            }

            lista.DelCxi(listingredientes[index].Id, id);

            listingredientes = lista.TraerCxi(int.Parse(e.CommandArgument.ToString()));

            listingredientes.RemoveAt(index);
           
            rptIngredientes.DataSource = listingredientes;
            rptIngredientes.DataBind();
            rptaddcomida.DataSource = listingredientes;
            rptaddcomida.DataBind();

        }

        protected void rpt_ItemCommandadd(object sender, RepeaterCommandEventArgs e)
        {
            listingredientes = lista.Traeraux();
            int index = 0;
            for (int x = 0; x < listingredientes.Count(); x++)
            {
                if (int.Parse(e.CommandArgument.ToString()) == listingredientes[x].Id)
                {
                    index = x;
                }
            }

            listingredientes.RemoveAt(index);
            foreach (Item item in listingredientes)
            {
                lista.cargaaux(item.Id, item.Descripcion, item.Cantidad, item.tipo);

            }
            rptIngredientes.DataSource = listingredientes;
            rptIngredientes.DataBind();
            rptaddcomida.DataSource = listingredientes;
            rptaddcomida.DataBind();
        }


        protected void btnLimpiarFiltros_Click(object sender, EventArgs e)
        {
            try
            {


                BindingList<Comida> pedido = lista.TraerComidas();

                pedido = lista.TraerComidas();
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


                BindingList<Comida> pedido = lista.TraerComidas();

                pedido = lista.TraerComidas();
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
