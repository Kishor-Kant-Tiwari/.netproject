<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgot Password.aspx.cs" Inherits="Project1.Forgot_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />
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
        #email {
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
        #password {
           outline: none;
           border: none;
           border-bottom: 1px solid grey;
           padding: 10px 0px;
           width: 100%;
           background-color: transparent;
           border-color: white;
           color: white;
           font-size:17px;
           margin-top: -11px;
           text-align:center;
       }
        #username {
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
        
       #forgotpassword{
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
       #forgotpassword:hover{
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
       #login:hover{
           text-decoration:underline;
       }
       #Label1{
           margin-left:60px;
           font-size:20px;
       }
       #Label2{
           background-color:red;
           color:white;
       }
    </style>    
</head>
<body>
  <div class="header">
        <marquee style="margin-top:20px;font-weight:bold;">DEVELOPED BY KISHOR KANT TIWARI</marquee>
		</div>
    <div class="center">
     <h1>Forgot Password</h1>
    <form id="form1" runat="server" autocomplete="off">
        <div class="text_field">
        <span></span>
        <asp:TextBox ID="email" runat="server" TextMode="Email" placeholder="Enter your Email"></asp:TextBox>
    </div>

        <div class="text_field">
        <span></span>
        <asp:TextBox ID="username" runat="server" placeholder="Enter your Username"></asp:TextBox>
    </div>
        <asp:Button ID="forgotpassword" runat="server" Text="Forgot Password" OnClick="forgotpassword_Click"/>
        <p id="login" style="text-align:center;cursor:pointer;"><a href="Login.aspx" style="text-decoration:none;color:white">Login</a></p>
       <%-- <p class="copyright" style="text-align:center;margin-top:24px">Developed By Kishor Kant Tiwari &copy; 2023</p>--%>
        <div class="text_field">
        <span></span>
        <asp:TextBox ID="password" runat="server" placeholder="" Text="Your Password is" ReadOnly> </asp:TextBox>
    </div>
    </form>
    </div>
</body>
</html>
