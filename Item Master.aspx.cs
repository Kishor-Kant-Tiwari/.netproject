using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Project1
{
    public partial class Item_Master : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                bindGridView();
            }

            SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
            con.Open();
            string str = "select * from Registration where username='" + Session["loginid"] + "'";
            SqlCommand com = new SqlCommand(str, con);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);
            login.Text = ds.Tables[0].Rows[0]["username"].ToString();
            login.Text = "<b><font color=red>" + login.Text + "</font>";

        }
        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            if (TextBoxSearch.Text == "")
            
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Search field is empty','','error')", true);
                bindGridView();
            }
            else
            {
                SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
                con.Open();
                string search = TextBoxSearch.Text;
                string s1 = "SELECT * from Itemmaster WHERE Itemname LIKE'%" + search + "%' OR  Purchaserate LIKE'%" + search + "%' ORDER BY Itemmaster.Itemname";
                
                
               
                    SqlDataAdapter da1 = new SqlDataAdapter(s1, con);
                    DataTable data1 = new DataTable();
                    da1.Fill(data1);
                    GridView1.DataSource = data1;
                    GridView1.DataBind();
                    TextBoxSearch.Focus();
                    con.Close();
                
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bindGridView(); //bindgridview will get the data source and bind it again
        }
        protected void save_click(object sender, EventArgs e)
        {

            SqlConnection con1 = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
            con1.Open();
            SqlCommand cmd1 = new SqlCommand("Select Itemname from Itemmaster where Itemname ='"+ Itemname.Text + "'", con1);
            SqlDataAdapter sd = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            float checknumber = 0;
            if (dt.Rows.Count > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Itemname already exists','not to be inserted please update if you want','info')", true);
               
            }

            else if (Itemname.Text.Length == 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please enter Item name','','error')", true);
                
            }
            else if (Purchaserate.Text.Length == 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please enter Purchase rate','','error')", true);
            }
            else if (float.TryParse(Purchaserate.Text,out checknumber)==false)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Only numeric value is allowed in the purchase rate','','error')", true);
            }
            else
            {
                if (save.Text == "Save")
                {
                    SqlCommand cmd = new SqlCommand(@"INSERT INTO [dbo].[Itemmaster]
            ([Itemname]
           ,[Purchaserate])
           
     VALUES
           ('" + Itemname.Text + "','" + Purchaserate.Text + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Data added successfully','','success')", true);
                    con.Close();
                    Itemname.Text = "";
                    Purchaserate.Text = "";
                    bindGridView();
                }

                else
                {

                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Itemmaster set Itemname='" + Itemname.Text + "', Purchaserate='" + Purchaserate.Text + "' where Id ='" + Id.Text + "'", con);
                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Data updated successfully','','success')", true);
                    con.Close();
                    bindGridView();
                    Itemname.Text = "";
                    Purchaserate.Text = "";
                    save.Text = "Save";
                    refresh.Text = "Refresh";
                    delete.Visible = false;
                    bindGridView();
                }
            }
            con1.Close();
        }
        void bindGridView()
        {
            con.Open();
            string s = "select * from Itemmaster";
            SqlDataAdapter da = new SqlDataAdapter(s, con);
            DataTable data = new DataTable();
            da.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();
            con.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Id.Text = (row.FindControl("Id") as Label).Text;
            Itemname.Text = (row.FindControl("Itemname") as Label).Text;
            Purchaserate.Text = (row.FindControl("Purchaserate") as Label).Text;
            save.Text = "Update";
            refresh.Text = "Cancel";
            delete.Visible = true;

        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Open();
            Label Id = GridView1.Rows[e.RowIndex].FindControl("Id") as Label;
            SqlCommand cmd = new SqlCommand("delete from Itemmaster where id=" + Convert.ToInt32(Id.Text), con);
            cmd.ExecuteNonQuery();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Data Deleted Successfully','','success')", true);
            con.Close();
            bindGridView();
        }

        protected void delete_click(object sender, EventArgs e)
        {
            con.Open();
            
            SqlCommand cmd = new SqlCommand("delete from Itemmaster where Id ='" + Id.Text + "'", con);

            cmd.ExecuteNonQuery();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Data Deleted Successfully','','success')", true);
            con.Close();
            save.Text = "Save";
            refresh.Text = "Refresh";
            Response.Redirect("Item Master.aspx");
            delete.Visible = false;
            bindGridView();
        }

        protected void refresh_click(object sender, EventArgs e)
        {
            if (refresh.Text == "Refresh")
            {
                Response.Redirect("Item Master.aspx");
            }
            else
            {
                save.Text = "Save";
                refresh.Text = "Refresh";
                Itemname.Text = "";
                Purchaserate.Text = "";
                Response.Redirect("Item Master.aspx");
            }

        }


    }
}