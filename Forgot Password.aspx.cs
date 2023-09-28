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
    public partial class Forgot_Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void forgotpassword_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
            SqlCommand cmd = new SqlCommand("SELECT password FROM Registration WHERE email = '" + email.Text + "' AND username = '"+ username.Text +"' ", con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                password.Text = sdr["password"].ToString();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Verified User','Your Password is " + password.Text + "','success')", true);
                email.Text = "";
                username.Text = "";
            }
            else if (email.Text == "") {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Enter your email id','','error')", true);
            }
            else if (username.Text == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Enter your username','','error')", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Invalid Credential','','error')", true);
                email.Text = "";
                username.Text = "";
                password.Text = "";
            }
        }
        
    }
}