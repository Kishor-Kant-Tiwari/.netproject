<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project1.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
       
       body{
           background-color: lightgrey;
           flex-direction: column;
           background:url('secondPng.svg') fixed ;
           background-repeat: no-repeat;
           background-position: 80px 150px;
           flex-wrap: wrap;
           background-size: 727px;
           overflow:hidden;
       }

       .header
        {
            width: 100%;
            height: 69px;
            background-color: #010711;
            position: fixed;
            top: 0;            
            color:white;
            margin-left:-8px;
        }
       .center{
           position:absolute;
           top:50%;
           left:80%;
           width:400px;
           border-radius:15px;
           transform:translate(-50%,-50%);
           height:500px;
           background-color: rgba(0, 0, 0, 0.8);
           border: 1px solid rgba(0, 0, 0, 0.1);
           box-shadow: 10px 10px 5px rgba(0, 0, 0, 0.1);
           color:white;
           

       } 
       .center h1{
           text-align:center;
           padding:0 0 25px 0;
           border-bottom:1px solid rgb(77 ,70,71);
       }
       .center form{
           padding:0 40px;
           box-sizing:border-box;
       }
       form .text_field{
           position:relative;
           border-bottom:2px solid #665c5c;
           margin: 50px 0;
       }
        #txt_loginid {
           /*width:100%;
           padding:0 5px;
           height:40px;
           font-size:16px;
           border:none;
           outline:none;
           background-color:transparent;
           color:white;
           border-color:white;
           border-bottom: 1px solid grey;*/
           /*background-color:aliceblue;*/

           outline: none;
           border: none;
           border-bottom: 1px solid grey;
           padding: 10px 0px;
           width: 100%;
           background-color: transparent;
           border-color: white;
           color: white;
           font-size:17px;
       }
        #txt_password {
           /*width:100%;
           padding:0 5px;
           height:40px;
           font-size:16px;
           border:none;
           outline:none;
           background-color: rgba(0, 0, 0, 0.5);*/
           /*background-color:aliceblue;*/

           outline: none;
           border: none;
           border-bottom: 1px solid grey;
           padding: 10px 0px;
           width: 100%;
           background-color: transparent;
           border-color: white;
           color: white;
           font-size:17px;
       } 
        
       #login{
           width:100%;
           height: 50px;
           border: 1px solid;
           background: #2681d8;
           border-radius: 25px;
           font-size:18px;
           color:white;
           font-weight:700;
           cursor:pointer;
           outline:none;
       }
       #login:hover{
           transition: .5s;
           border-color: #2681d8;
       }
       #lbl_loginid{
           font-weight:bold;
           font-size:17px;
       }
       #lbl_password{
           font-weight:bold;
           font-size:17px;
       }
       ::placeholder{
           color:white;
           font-weight:bold;
           font-size:17px;
       }
       #register:hover{
           text-decoration:underline;
       }
       #forgotpassword:hover{
           text-decoration:underline;
       }
       #registerforgot{
           display:inline-flex;
           margin-top:15px;
           
       }
       #registerforgot #forgotpassword{
           margin-left:130px;
       }
       #registerforgot #register{
           margin-left:20px;
       }
       @media only screen and (max-width:500px){
           .center{
               width: 84%;
               left: 50%;
               top: 55%;
           }
       }
       @media only screen and (min-width:501px) AND (max-width:800px){
           .center{
               width: auto;
               left: 50%;
               top: 55%;
           }
       }
    </style>
</head>
<body oncontextmenu="return false;">
    <div class="header">
        <marquee style="margin-top:20px;font-weight:bold;">DEVELOPED BY KISHOR KANT TIWARI</marquee>
	</div>
    <div class="center">
     <h1>LOGIN</h1>
    <form id="form1" runat="server" autocomplete="off">
    <div class="text_field">
        <span></span>
        <asp:TextBox ID="txt_loginid" runat="server" placeholder="Enter your username"></asp:TextBox>
    </div>
    <div class="text_field">
        <span></span>
        <asp:TextBox ID="txt_password" runat="server" TextMode="Password" placeholder="Enter your Password"></asp:TextBox>
    </div>
        <asp:Button ID="login" runat="server" Text="Login" onClick="Login_Click"/>
        <div id="registerforgot">
        <p id="register" style="cursor:pointer"><a href="Registration.aspx" style="text-decoration:none;color:white">Register</a></p>
        <p id="forgotpassword" style="cursor:pointer;"><a href="Forgot Password.aspx" style="text-decoration:none;color:white">Forgot Password</a></p>
        </div>
        <p class="copyright" style="text-align:center;margin-top:24px">Developed By Kishor Kant Tiwari &copy; 2023</p>
    </form>
    </div>
</body>
</html>