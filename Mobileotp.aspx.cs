using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net;
using System.Web.ClientServices;
using System.Collections.Specialized;
using System.Configuration;

namespace Project1
{
    public partial class Mobileotp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnsendOtp_Click(object sender, EventArgs e)
        {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            pnl1.Visible = false;
            pnl2.Visible = true;
            Random random = new Random();
            int value = random.Next(1001, 9999);
            string destinationaddress = "+91" + txtmobileNo.Text;
            string message = "Your OTP is " + value + "(Send by R.R.Research and development founder is Ramesh Chandra)";
            string message1 = HttpUtility.UrlEncode(message);
            using (var wb = new WebClient())
            {
                byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection() {
            {
                "apikey",
                "NzIzNDU4NTU1MDU0NmI3NjMyNTM1NTM0NGY1YTQ1NmY="
            }, {
                "numbers",
                destinationaddress
            }, {
                "message",
                message1
            }, {
                "sender",
                "TXTLCL"
            }
        });
                string result = System.Text.Encoding.UTF8.GetString(response);
                Session["OTP"] = value;
            }
        }
        protected void btnverify_Click(object sender, EventArgs e)
        {
            if (txtverifyMobileNO.Text == Session["OTP"].ToString())
            {
                pnl2.Visible = false;
                ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "confirm('Your Mobilenumber has been verify sccessfully.');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "confirm('Your OTP is not correct please enter correct OTP');", true);
                pnl2.Visible = true;
            }
        }
    }
}