<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Project1.Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
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
           top:55%;
           left:80%;
           width:400px;
           border-radius:15px;
           transform:translate(-50%,-50%);
           height:550px;
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
           margin: 22px 0;
       }
        

           
        #name,#mobilenumber,#username,#password,#email {
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
        
       #register{
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
       #register:hover{
           transition: .5s;
           border-color: #2681d8;
       }
       #name,#mobilenumber,#username,#password,#email{
           font-weight:bold;
           font-size:17px;
            height: 39px;
        }
       
       ::placeholder{
           color:white;
           font-weight:bold;
           font-size:17px;
       }
       #togglePassword{
           float:left;
           margin-left: 320px;
           margin-top: -28px;
       }
       #login:hover{
           text-decoration:underline;
       }

         @media only screen and (max-width: 600px) {
             body {
                 background-color: lightblue;
             }
         }
    </style>    
</head>
<body>
    <div class="header">
        <%--<img style="width:80px;height:50px;margin-left:575px;border-radius:50px;margin-top:10px;" src="download.png"/>
		<h2 style="text-align:center;font-size:32px;margin-top:-45px">SP INFOCOM</h2>--%>
        <marquee style="margin-top:20px;font-weight:bold;">DEVELOPED BY KISHOR KANT TIWARI</marquee>
		</div>
    <div class="center">
     <h1>Registration</h1>
    <form id="form1" runat="server" autocomplete="off">
    <div class="text_field">
        <span></span>
        <asp:TextBox ID="name" runat="server" placeholder="Enter your name"></asp:TextBox>
    </div>
    <%--<div class="text_field">
        <span></span>
        <asp:TextBox ID="mobilenumber" runat="server" placeholder="Enter your Mobileno."></asp:TextBox><asp:Button ID="btnsendOtp" runat="server" Text="Send OTP" OnClick="btnsendOtp_Click" />
    </div>

        <div class="text_field">
        <span></span>
        <asp:TextBox ID="otp" runat="server" placeholder="Enter your otp"></asp:TextBox><asp:Button ID="btnverify" runat="server" Text="Verify" OnClick="btnverify_Click" />
    </div>--%>
        <div class="text_field">
        <span></span>
        <asp:TextBox ID="email" runat="server" TextMode="Email" placeholder="Enter your Email"></asp:TextBox>
    </div>

        <div class="text_field">
        <span></span>
        <asp:TextBox ID="username" runat="server" placeholder="Enter your username"></asp:TextBox>
    </div>
        <div class="text_field">
        <span></span>
        
        <asp:TextBox ID="password" runat="server" TextMode="Password" placeholder="Enter your password"> </asp:TextBox><i id="togglePassword" class="fa fa-eye" style="color:white"></i>
    </div>
        <asp:Button ID="register" runat="server" Text="Register" OnClick="register_click"/>
        <p id="login" style="text-align:center;cursor:pointer"><a href="Login.aspx" style="text-decoration:none;color:white">Login</a></p>
    </form>
    </div>
    <script type="text/javascript">
        var togglePassword = document.querySelector('#togglePassword');
        var Password = document.querySelector('#password');
        togglePassword.addEventListener('click', function (e) {
            const type = Password.getAttribute('type') === 'Password' ? 'text' : 'Password';
            Password.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
        });
</script>
</body>
</html>
