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
using System.Net;
using System.Web.ClientServices;
using System.Collections.Specialized;

namespace Project1
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //protected void btnsendOtp_Click(object sender, EventArgs e)
        //{
        //    ServicePointManager.Expect100Continue = true;
        //    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
        //    Random random = new Random();
        //    int value = random.Next(1001, 9999);
        //    string destinationaddress = "+91" + mobilenumber.Text;
        //    string message = "Your OTP is " + value + "(Send by KISHOR KANT TIWARI SP INFOCOM)";
        //    string message1 = HttpUtility.UrlEncode(message);
        //    using (var wb = new WebClient())
        //    {
        //        byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection() {
        //    {
        //        "apikey",
        //        "NGUzMzZkNjM2ZDcxNDI0NTdhNTA2Njc0NTQ0YjM1MzE="
        //    }, {
        //        "numbers",
        //        destinationaddress
        //    }, {
        //        "message",
        //        message1
        //    }, {
        //        "sender",
        //        "TXTLCL"
        //    }
        //});
        //        string result = System.Text.Encoding.UTF8.GetString(response);
        //        Session["OTP"] = value;
        //        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('SUCCESS','','success')", true);
        //    }
        //}
        //protected void btnverify_Click(object sender, EventArgs e)
        //{
        //    if (otp.Text == Session["OTP"].ToString())
        //    {
                
        //        ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "confirm('Your Mobilenumber has been verify sccessfully.');", true);
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "confirm('Your OTP is not correct please enter correct OTP');", true);
               
        //    }
        //}
        protected void register_click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
            con.Open();
            SqlCommand cmd = new SqlCommand("Select email from Registration where email ='" + email.Text + "'", con);
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sd.Fill(dt);

            
            if (dt.Rows.Count > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('email id already exists in the system','Please enter different email id','error')", true);

            }
             if (name.Text == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please enter your name','','error')", true);
            }
            else if (email.Text == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please enter your email','','error')", true);
            }
            else if (username.Text == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please enter your username','','error')", true);
            }
            
            
            else if (password.Text == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please enter your password','','error')", true);
            }
            else
            {
                SqlConnection con1 = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
                SqlCommand cmd1 = new SqlCommand(@"INSERT INTO [dbo].[Registration]
            ([name]
           ,[email],[username],[password])
           
     VALUES
           ('" + name.Text + "','" + email.Text + "','" + username.Text + "','" + password.Text + "')", con1);

                con1.Open();
                cmd1.ExecuteNonQuery();
                ClientScript.RegisterClientScriptBlock(this.GetType(),"k", "swal('Registration successfull','Please click on Login to continue','success')", true);
                con1.Close();
                name.Text = "";
                //mobilenumber.Text = "";
                email.Text = "";
                username.Text = "";
                password.Text = "";
                

            }
            con.Close();
        }

    }
}