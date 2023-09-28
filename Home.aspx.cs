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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            login.Text = "<b><font color=Brown>" + "WELCOME:: " + "</font>" + "<b><font color=red>" + Session["loginid"] + "</font>";
            SqlConnection con = new SqlConnection("Data Source=KISHOR-KANT123\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;");
            con.Open();
            string str = "select * from Registration where username='" + Session["loginid"] + "'";
            SqlCommand com = new SqlCommand(str, con);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);
            login.Text = ds.Tables[0].Rows[0]["username"].ToString();
            login.Text =  "<b><font color=red>" + login.Text + "</font>";

        }

        
    }
}