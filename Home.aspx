<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Project1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .menuH
            { 
        margin: 0; 
        width: 45%; 
        float:none;
        behavior: url("/horizontal/menuh/cssmenu.htc");
        height: 36px;
        background: #D4D4D4 url(bg.gif) repeat-x 0 0;
        border: 1px solid #BBB;
        position:relative;
        z-index:4;
        font-family: Arial, Helvetica, sans-serif;
        list-style: none;
        padding: 0;
        border-radius:5px;
    }

    .menuH li
    {
        padding: 0;
    
        float: left;
        height: 36px;
        position: relative;
    }
    .menuH li:hover, .menuH li.onhover
    {
        background: white url(bg.gif) repeat-x 0 -48px;
    }

    ul.menuH a
    {
        padding: 0 20px;
        line-height: 36px; 
        font-size: 12px;
        font-weight: bold;
        color: black;
        display: block;
        outline: 0;
        text-decoration: none;
        cursor: pointer;
    }
    .menuH a:hover
    {
        color: red;

    }
        
    ul.menuH ul
    {
        width:210px;
        position: absolute;
        left: -9999px;
        border: 1px solid #DDD;
        border-top: 0; 
        background: #FFF;    
        text-align: left;
        list-style: none; margin: 0;  
        padding: 10px 0;
        box-sizing:content-box;
    }

    .menuH li li
    {
        float: none;
        white-space:nowrap;
        height: 26px;
    }
    .menuH li li:hover, .menuH li li.onhover
    {
        background:#f7f7f7;
    }
    .menuH ul a
    {
        padding: 0 20px;
        line-height: 30px;
        font-size: 0.9em;
        font-weight: normal;
        color: #0066CC;
        text-align: left;
    }

    .menuH ul a:hover
    {
        color: red;
    }

    .menuH li:hover ul, .menuH li.onhover ul
    {
        left: -1px;
        top: auto;
    }


    .menuH ul ul
    {
        border-top: 1px solid #DDD;
    }
    .content{
        margin-top:10px;
        margin-left:183px;
        color:red;
        font-weight:bold;
    
    }
    .content #login1{
        margin-left: 385px;
    }
    .content #logout{
        margin-left:385px;
    }
    .content #logout:hover{
        text-decoration:underline;
    }
    .container{
        background-color:green;
        padding:4px;
        margin-top:10px;
        width:100%;
        margin-left:-8px;
    
    }
    #Image1{
        width:100%;
        margin-top:16px;
    }
    </style>
</head>
<body oncontextmenu="return false;">
    <form id="form1" runat="server">
        <table>
            <ul class="menuH decor1">
        <li style="margin-left:70px;"><a class="arrow">Masters <i class="fa fa-caret-down"></i></a>
            <ul>
                <li><a href="Item Master.aspx" class="arrow">Item Master</a></li>
                <li><a href="#" class="arrow">Item Group Master</a></li>
                <li><a href="#" class="arrow">Item Company Master</a></li>
                <li><a href="#" class="arrow">Customer Master</a></li>
                <li><a href="#" class="arrow">Supplier Master</a></li>
                <li><a href="#" class="arrow">Godown\Shop Master</a></li>
   
            </ul>
        </li>

        <li style="margin-left:24px;"><a class="arrow">Inventory <i class="fa fa-caret-down"></i></a>
            <ul>
                <li><a href="Sale invoice.aspx"  class="arrow">Sale Invoice</a></li>
                <li><a href="#" class="arrow">Purchase Invoice</a></li>
                <li><a href="#" class="arrow">Purchase Return</a></li>
                <li><a href="#" class="arrow">Sale Return</a></li>
                <li><a href="#" class="arrow">Stock Transfer</a></li>
   
            </ul>
        </li>
        
        <li style="margin-left:24px;"><a class="arrow">Accounts</a></li>
        <li style="margin-left:24px;"><a class="arrow">MIS</a></li>
        <li style="margin-left:24px;"><a class="arrow">GST Return</a></li>

       </ul>
   </table>
        <div class="container">

        </div>
        <div class="content">
        <asp:Label ID="home" runat="server" Text="Home"><i class="fa fa-home"></i> <a href="Home.aspx" style="text-decoration:none;color:red;">Home</a></asp:Label>
        <asp:Label ID="login1" runat="server" Text="Home"> Login By:
            <asp:Label ID="login" runat="server" Text="Home"></asp:Label>
        </asp:Label>
        <asp:Label ID="logout" runat="server" Text="Home"><a href="Login.aspx" style="text-decoration:none;color:red;">Logout</a><i class="fa fa-sign-out"></i></asp:Label>
        </div>
        <%--<table width="80" align="center">
            <tr>
                <td align="center" valign="middle">
                    <table width="100%">
                        <tr>
                                <td align="center" bgcolor="#E1E1E2" style="text-align: left" colspan="6">
                                    <span id="ctl00_ContentPlaceHolder1_Label3" style="font-family: Verdana; font-size: 10pt;
                                        color: #000000; font-weight: 700;">Item Master</span>
                                </td>
                            </tr>

                    </table>
                </td>
            </tr>
        </table>--%>
        <asp:Image ID="Image1" runat="server" ImageUrl="img.jpg" cssClas="img1" oncontextmenu="return false;"/>

        
        <%--<asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick" Orientation="Horizontal" CssClass="Menu">
            <Items>
                <asp:MenuItem Text="Masters" Value="Masters">
                    <asp:MenuItem Text="Item Master" Value="Item Master"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Inventory" Value="Inventory">
                    <asp:MenuItem Text="Inventory" Value="Sale Invoice"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Accounts" Value="Accounts"></asp:MenuItem>
                <asp:MenuItem Text="MIS" Value="MIS"></asp:MenuItem>
                <asp:MenuItem Text="GST Return" Value="GST Return"></asp:MenuItem>
            </Items>
            <StaticMenuItemStyle BackColor="#003366" ForeColor="White" HorizontalPadding="151px" ItemSpacing="2px" VerticalPadding="10px" />
        </asp:Menu>--%>
    
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
