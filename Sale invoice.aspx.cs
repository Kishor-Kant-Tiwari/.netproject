using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Text.RegularExpressions;
using System.Globalization;
using System.Threading;
using System.Web.UI.HtmlControls;

namespace Project1
{
    
    public partial class Sale_invoice : System.Web.UI.Page
    {
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            

            Invoicedate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            Invoiceno();
           
            
            SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
            if (!IsPostBack)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select Itemname from Itemmaster", con);
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet di = new DataSet();
                adpt.Fill(di);
                if (di.Tables[0].Rows.Count > 0)
                {
                    DropDownList1.Items.Clear();
                    DropDownList1.DataSource = di.Tables[0];
                    DropDownList1.DataTextField = "Itemname";
                    DropDownList1.DataBind();
                }
                DropDownList1.Items.Insert(0, new ListItem("<-Select Item Name->", "0"));
                con.Close();
                bindGridView();
                bindGridView1();

                foreach (GridViewRow row in GridView1.Rows)
                {
                    GridView1.DeleteRow(row.RowIndex);
                }
                tamount1.Text = "";
                Rtamount1.Text = "";
            }
            con.Open();
            string str = "select * from Registration where username='" + Session["loginid"] + "'";
            SqlCommand g = new SqlCommand(str, con);
            SqlDataAdapter da = new SqlDataAdapter(g);
            DataSet dsss = new DataSet();
            da.Fill(dsss);
            login.Text = dsss.Tables[0].Rows[0]["username"].ToString();
            login.Text = "<b><font color=red>" + login.Text + "</font>";
            con.Close();
        }
        public void deletegridview()
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                GridView1.DeleteRow(row.RowIndex);
            }
        }

        public void Invoiceno()
        {
            try
            {
            SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
            SqlCommand cmd = new SqlCommand("SELECT max(Invoicenumber) from Finaliteminvoice5 ", con);
            con.Open();
            var maxid = cmd.ExecuteScalar() as string;
            if (maxid == null)
            {
                Invoicenumber.Text = "SAL000001";
            }
            else
            {
                int intval = int.Parse(maxid.Substring(3, 6));
                intval = intval + 1;
                Invoicenumber.Text = String.Format("SAL{0:000000}", intval);
            }
            con.Close();
            }
            catch (Exception)
            {
                return;
            }   
        }

        protected void TextBoxStartDate_TextChanged(object sender, EventArgs e)
        {
            Invoicedate.Text = DateTime.Now.ToString("dd-MM-yyyy");   
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Id.Text = (row.FindControl("Id") as Label).Text;
            DropDownList1.SelectedValue = (row.FindControl("Itemname") as Label).Text;
            quantity.Text = (row.FindControl("Quantity") as Label).Text;
            rate.Text = (row.FindControl("Rate") as Label).Text;
            amount.Text = (row.FindControl("Amount") as Label).Text;
            add.Text = "Update";
            refresh.Text = "Cancel";
            refresh.Visible = true;
        }
        protected void gv_SelectedIndexChanged(object sender, EventArgs e)
            {
            string selectedID = DropDownList1.SelectedItem.Text;
            SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
            SqlCommand cmd = new SqlCommand("SELECT Purchaserate FROM Itemmaster WHERE Itemname = '" + selectedID + "' ", con);
            con.Open();
            cmd.CommandType = CommandType.Text;
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read()){
                rate.Text = sdr["Purchaserate"].ToString();
                quantity.Text = "";
                amount.Text = "";
            }
            else
            {
                quantity.Text = "";
                rate.Text = "";
                amount.Text = "";
            }
            con.Close();
    }
        void bindGridView()
        {
            SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
            con.Open();
            string s = "select * from Itemdetailsinvoice1";
            SqlDataAdapter da = new SqlDataAdapter(s, con);
            DataTable data = new DataTable();
            da.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();
            con.Close();    
        }
        decimal sumFooterValue = 0;
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string amount = ((Label)e.Row.FindControl("Amount")).Text;
                string Id = ((Label)e.Row.FindControl("Id")).Text;
                decimal totalvalue =  Convert.ToDecimal(amount);
                //e.Row.Cells[2].Text = totalvalue.ToString();
                sumFooterValue += totalvalue;
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lbl = (Label)e.Row.FindControl("lbltotal");
                //Label lbl1 = (Label)e.Row.FindControl("total");
                if (lbl.Text == "")
                {
                    tamount1.Text = "0";
                    Rtamount1.Text = "0";   
                }
                else
                {
                    lbl.Text = sumFooterValue.ToString();
                    tamount1.Text = sumFooterValue.ToString();
                    Rtamount1.Text = Math.Round(sumFooterValue).ToString();
                }
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
            con.Open();
            Label Id = (Label)GridView1.Rows[0].Cells[1].FindControl("Id");
            SqlCommand cmd = new SqlCommand("delete from Itemdetailsinvoice1 where Id=" + Convert.ToInt32(Id.Text), con);
            cmd.ExecuteNonQuery();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Data Deleted Successfully','','success')", true);
            con.Close();
            bindGridView();
            if (GridView1.Rows.Count == 0)
            {
                Response.Redirect("Sale invoice.aspx");
            }
        }
        protected void add_click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
            //TextBox total = (TextBox)GridView1.FooterRow.FindControl("lbltotal");
            if (DropDownList1.SelectedItem.Text == "<-Select Item Name->")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please select item name','','error')", true);
                quantity.Text = "";
            }
            else if (quantity.Text == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please enter the quantity','','error')", true);
            }
            else if (amount.Text == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Amount can not be zero','','error')", true);
            }
            else if (rate.Text == "0")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Rate can not be zero','','error')", true);
            }
            else
            {
                if (add.Text == "Add")
                {
                    SqlCommand cmd = new SqlCommand(@"INSERT INTO [dbo].[Itemdetailsinvoice1]
            ([Itemname]
           ,[Quantity],[Rate],[Amount])
           
     VALUES
           ('" + DropDownList1.SelectedItem.Text + "','" + quantity.Text + "','" + rate.Text + "','" + amount.Text + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    bindGridView();
                    quantity.Text = "";
                    rate.Text = "";
                    amount.Text = "";
                    DropDownList1.ClearSelection(); 
                    
                }
                else
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Itemdetailsinvoice1 set Itemname='" + DropDownList1.SelectedItem.Text + "', Quantity='" + quantity.Text + "', Rate='" + rate.Text + "', Amount='" + amount.Text + "' where Id ='" + Id.Text + "'", con);
                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Data updated successfully','','success')", true);
                    con.Close();
                    bindGridView();
                    //DropDownList1.Items.FindByText("<-Select Item Name->").Selected = true;
                    quantity.Text = "";
                    rate.Text = "";
                    amount.Text = "";
                    DropDownList1.ClearSelection();  
                    add.Text = "Add";
                    refresh.Visible = false;
                    
                }
            }    
        }
        protected void refresh_click(object sender, EventArgs e)
        {
            if (refresh.Text == "Cancel")
            {
               add.Text = "Add";
               refresh.Visible = false;
               DropDownList1.ClearSelection();  
               quantity.Text = "";
               rate.Text = "";
               amount.Text = "";
            }
        }
        void bindGridView1()
        {
            SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
            con.Open();
            string s = "select * from Finaliteminvoice5";
            SqlDataAdapter da1 = new SqlDataAdapter(s, con);
            DataTable data1 = new DataTable();
            da1.Fill(data1);
            GridView2.DataSource = data1;
            GridView2.DataBind();
            con.Close();
        }
        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
            con.Open();
            Label Id = GridView2.Rows[e.RowIndex].FindControl("Id") as Label;
            Label Invoicenumber = GridView2.Rows[e.RowIndex].FindControl("Invoicenumber") as Label;
            Label Date = GridView2.Rows[e.RowIndex].FindControl("Date") as Label;
            Label CustomerDetails = GridView2.Rows[e.RowIndex].FindControl("CustomerDetails") as Label;
            Label Invoiceamount = GridView2.Rows[e.RowIndex].FindControl("Invoiceamount") as Label;
            SqlCommand cmd = new SqlCommand("delete from Finaliteminvoice5 where Id=" + Convert.ToInt32(Id.Text), con);
            cmd.ExecuteNonQuery();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Data deleted successfully','','success')", true);
            con.Close();
            bindGridView1();
            Response.Redirect("Sale invoice.aspx");
            
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            bindGridView1(); 
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            Id1.Text = (row.FindControl("Id") as Label).Text;
            Invoicenumber.Text = (row.FindControl("Invoicenumber") as Label).Text;
            Invoicedate.Text = (row.FindControl("Date") as Label).Text;
            Customername.Text = (row.FindControl("CustomerDetails") as Label).Text;
            Mobileno.Text = (row.FindControl("Mobilenumber") as Label).Text;
            DropDownList1.SelectedItem.Text = (row.FindControl("Itemname") as Label).Text;
            quantity.Text = (row.FindControl("Quantity") as Label).Text;
            rate.Text = (row.FindControl("Rate") as Label).Text;
            amount.Text = (row.FindControl("Amount") as Label).Text;
            tamount1.Text = (row.FindControl("Totalamount") as Label).Text;
            Rtamount1.Text = (row.FindControl("Netamount") as Label).Text;
            save.Text = "Update";
            refresh1.Text = "Cancel";
        }
        protected void refresh1_click(object sender, EventArgs e)
        {
            if (refresh1.Text == "Refresh")
            {
                Response.Redirect("Sale invoice.aspx");
            }
            else
            {
                save.Text = "Save";
                refresh.Text = "Refresh";
                Response.Redirect("Sale invoice.aspx");
            }
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            if (TextBoxSearch.Text == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Search field is empty','','error')", true);
                bindGridView1();
            }
            else 
            {
                SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
                con.Open();
                string search = TextBoxSearch.Text;
                string s1 = "SELECT * from Finaliteminvoice5 WHERE Invoicenumber LIKE'%" + search + "%' OR  Date LIKE'%" + search + "%' OR CustomerDetails LIKE'%" + search + "%' OR Mobilenumber LIKE'%" + search + "%' OR Netamount LIKE'%" + search + "%' ORDER BY Finaliteminvoice5.CustomerDetails";
                SqlDataAdapter da1 = new SqlDataAdapter(s1, con);
                DataTable data1 = new DataTable();
                da1.Fill(data1);
                GridView2.DataSource = data1;
                GridView2.DataBind();
                TextBoxSearch.Focus();
                con.Close();
            }
        }

        protected void save_click(object sender, EventArgs e)
        {
            //SqlDataReader reader = null;
            SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
            con.Open();
            String sdad;
            SqlCommand cmd1 = new SqlCommand("Select Invoicenumber from Finaliteminvoice5 where Invoicenumber ='"+ Invoicenumber.Text +"' ", con);
                    sdad = (String)cmd1.ExecuteScalar();
                    con.Close();
                    if (Customername.Text.Length == 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Enter customer name','','error')", true);
                    }
                    else if (!Regex.IsMatch(Customername.Text, @"^[a-zA-Z ]*$"))
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Only letters are allowed, no digits!','Customer Name','error')", true);
                    }
                    else if (Customername.Text.Length < 3)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Invalid customer name','Less character','error')", true);
                    }
                    else if (Invoicenumber.Text == sdad)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Invoice number can not be same','','error')", true);

                    }
                    else if (Invoicenumber.Text.Length == 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please enter invoice number','Invoice No.','error')", true);
                    }

                    else if (Invoicedate.Text.Length == 0)
                    {
                        Response.Write("<script>alert('Invoicedate can not be blank')</script>");
                    }
                    else if (Mobileno.Text.Length == 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please enter mobile number','Mobile No.','error')", true);
                    }
                    else if (Mobileno.Text.Length < 10)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please enter valid mobile number','Digits less than 10','error')", true);
                    }
                    else if (Mobileno.Text.Length > 10)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please enter valid mobile number','Digits greater than 10','error')", true);
                    }
                    else if (tamount1.Text.Length == 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Total Amount can not be blank!','Please add the item details first','error')", true);
                    }
                    else
                    {
                     
                        if (save.Text == "Save")
                        {
                            //int h = 0;
                            //Label nt = (Label)GridView1.Rows[h].Cells[1].FindControl("Itemname");
                            //string itemname = nt.Text;
                            //Label nt1 = (Label)GridView1.Rows[h].Cells[1].FindControl("Quantity");
                            //string quantity = nt1.Text;
                            //Label nt3 = (Label)GridView1.Rows[h].Cells[1].FindControl("Rate");
                            //string rate = nt3.Text;
                            //Label nt4 = (Label)GridView1.Rows[h].Cells[1].FindControl("Amount");
                            //string nt5 = nt4.Text;
                            SqlCommand cmd = new SqlCommand(@"INSERT INTO [dbo].[Finaliteminvoice5]
                            ([Invoicenumber],[Date],[CustomerDetails],[Mobilenumber],[Netamount])
                            VALUES
                            ('" + Invoicenumber.Text + "','" + Invoicedate.Text + "','" + Customername.Text + "','" + Mobileno.Text + "','" + Rtamount1.Text + "' )", con);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            //ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Data added successfully','','success')", true);
                            con.Close();
                            bindGridView1();
                            Invoiceno();
                            //deletegridview();
                            Customername.Text = "";
                            Mobileno.Text = "";
                            tamount1.Text = "";
                            Rtamount1.Text = "";
                        }
                        else
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("update Finaliteminvoice1 set Invoicenumber='" + Invoicenumber.Text + "', Date='" + Invoicedate.Text + "', CustomerDetails='" + Customername.Text + "' where Id ='" + Id1.Text + "'", con);
                            cmd.ExecuteNonQuery();
                            con.Close();
                            Response.Write("<script>alert('Data is updated successfully')</script>");
                            bindGridView1();
                            con.Close();
                        }
                    }
                }
            }  
        }