using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Project1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Login_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
                string uid = txt_loginid.Text;
                string pass = txt_password.Text;
                con.Open();
                string qry = "select * from Registration where username='" + uid + "' and password='" + pass + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    Session["loginid"] = txt_loginid.Text;
                    Response.Redirect("Home.aspx");
                }
                else if (txt_loginid.Text.Length == 0)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please enter your username','','error')",true);
                
                }
                else if (txt_password.Text.Length == 0)
                {

                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please enter your Password','','error')", true);
                
                }
                
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Invalid credential','not a registered user','error')", true);
                    txt_loginid.Text = "";
                    txt_password.Text = "";


                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }  
        }
        
    }
}