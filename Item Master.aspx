<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Item Master.aspx.cs" Inherits="Project1.Item_Master" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Item Master</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
        padding:3px;
        margin-top:10px;
        width:100%;
        margin-left:-8px;
    
    }
    .container1{
        background-color:green;
        padding:1px;
        margin-top:10px;
        width:100%;
        margin-left:-8px;
    
    }
    #save{
               background-color: #393d3d;
                color: white;
                border-radius: 9px;
                font-size: 15px;
                padding-right:15px;
                padding-left:15px;
                cursor:pointer;
            }
    #save:hover{
                background-color: black;
                transition: .5s;
    }
    #refresh{
                background-color: #393d3d;
                color: white;
                border-radius: 9px;
                font-size: 15px;
                padding-right: 15px;
                padding-left: 15px;
                cursor: pointer;
            }
    #refresh:hover{
                background-color: black;
                transition: .5s;
    }
    #delete{
                background-color: #393d3d;
                color: white;
                border-radius: 9px;
                font-size: 15px;
                padding-right:15px;
                padding-left:15px;
                cursor:pointer;
            }
    #delete:hover{
                background-color: black;
                transition: .5s;
    }
    #GridView1{
        margin:auto;
        margin-top:0px;
        width:95%;
        text-align:center;
        box-shadow:0 0.5rem 1rem rgba(0, 0, 0, 0.15) !important;
         border:1px solid black;
    }
    #GridView1 tbody tr td{
        border:none;
    }
    #GridView1 tbody tr th{
        border:none;
    }
    body{
        background-color:whitesmoke;
    }
    #GridView1 tbody tr:nth-of-type(odd){
        background-color:white;
    }
    #GridView1 tbody tr:hover{
        background-color:lightgoldenrodyellow;
    }
    #Itemname,#Purchaserate,.text-search{
        border:1px solid green;
        border-radius:3px;
    }
    #tablesearch{
    margin-left:650px;
    margin-top:20px;
}
    .button-search{
            background-color: #393d3d;
            color: white;
            border-radius: 9px;
            margin-left: 10px;
            font-size: 15px;
            padding-right:15px;
            padding-left:15px;
            cursor:pointer;
        }
        .button-search:hover{
            background-color: black;
            transition: .5s;
        }
        .pager span { 
             background: #26B;
             color: #fff;
             border: solid 1px #AAE
        }
        .select i:hover{
    font-weight:bold;
}
        
    </style>
</head>
<body >
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
                <li><a href="Sale invoice.aspx" class="arrow">Sale Invoice</a></li>
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
        <div class="container1">

        </div>




        <div class="up" style="padding:0.25rem !important;margin-top:0.25rem !important; width:75%;padding-right:15px;padding-left:15px;margin-right:auto;margin-left:auto;margin-bottom:0.5rem;font-weight:normal">
            <div class="container2" style="margin:0">
            <div class="container3" style="color:#fff;padding:10px;box-shadow:0 0.5rem 1rem rgba(0, 0, 0, 0.15) !important;background-color:#28a745">
                Item Master
            </div>
            <div class="container4" style="padding:0.25rem;margin-top:0.25rem;border:1px solid #dee2e6;position:relative;flex-direction:column;display:flexbox;margin:0;word-wrap:break-word;background-color:#fff;background-clip:border-box;border-radius:0.25rem;margin-top:10px;box-shadow:0 0.5rem 1rem rgba(0, 0, 0, 0.15) !important;padding-bottom:20px">
                <div class="cardbody" style="padding:0.35rem 1rem 0.35rem 1rem">
                    <div class="row" style="display:flexbox;flex-wrap:wrap;margin-right:-15px;margin-left:-15px;">
                        <table style="border-collapse:separate;border-spacing:15px;margin-left:auto;margin-right:auto">
                     <tr>
                    <td> <asp:textbox id="Id" runat="server" Visible="false" AutoCompleteType="Disabled" ReadOnly="true"></asp:textbox></td>  
                    </tr>    
                    <tr>
                     <td>Item Name:</td><td> <asp:textbox id="Itemname" runat="server" AutoCompleteType="Disabled"></asp:textbox></td>   
                    
                     <td>Purchase rate:</td><td> <asp:textbox id="Purchaserate" AutoCompleteType="Disabled" runat="server"></asp:textbox></td>   
                     </tr>
                     </table>
                        <table style="margin-left:auto;margin-right:auto;margin-top:25px">       
                    <tr>
                    <td><asp:Button ID="save" runat="server" Text="Save" OnClick="save_click" ></asp:Button></td>
                        <td><asp:Button ID="refresh" runat="server" Text="Refresh" OnClick="refresh_click" ></asp:Button></td>
                    <td><asp:Button ID="delete" runat="server" Text="Delete" Visible="false" OnClick="delete_click" ></asp:Button></td>
                   
                    
                </tr>             
            </table> 

           <table id="tablesearch">
            <tr>
           <td><p style="color:red;font-size:17px;">Search by any Name:</p></td> <td><asp:TextBox ID="TextBoxSearch" runat="server"
                CssClass="text-search"
                Text=""
                Width="200" AutoCompleteType="Disabled" /></td>
            <td><asp:Button ID="ButtonSearch" runat="server"
                CssClass="button-search"
                Text="Search"
               OnClick="ButtonSearch_Click"  /></td>
                </tr>
        </table>


            <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="5" AllowSorting="true" OnPageIndexChanging="GridView1_PageIndexChanging" ShowHeaderWhenEmpty="True" EmptyDataText="No records Found" AutoGenerateColumns="False" BorderWidth="3px" CellPadding="4" CellSpacing="2" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <PagerStyle CssClass="pager"  />
            <Columns>
                <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="select" ControlStyle-ForeColor="Blue" SelectText="<i class='fa fa-pencil' aria-hidden='true'></i>"/>
                <asp:TemplateField HeaderText="Id" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="Id" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Itemname">
                    <ItemTemplate>
                        <asp:Label ID="Itemname" runat="server" Text='<%# Eval("Itemname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Purchaserate">
                    <ItemTemplate>
                        <asp:Label ID="Purchaserate" runat="server" Text='<%# Eval("Purchaserate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
            </Columns>
             <HeaderStyle BackColor="Gray" ForeColor="White" />
            <PagerStyle BackColor="#929580" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>

                    </div>

                </div>

            </div>
                
        </div>
        </div>






        <%--<fieldset style="width:30%;padding:10px;margin-top:15px;flex-wrap:wrap">
            <legend>Item Master</legend>
           <table style="border-collapse:separate;border-spacing:15px">
                <tr>
                 <td> <asp:textbox id="Id" runat="server" Visible="false" AutoCompleteType="Disabled" ReadOnly="true"></asp:textbox></td>  
                </tr>    
                <tr>
                     <td>Item Name:</td><td> <asp:textbox id="Itemname" runat="server" AutoCompleteType="Disabled"></asp:textbox></td   
                </tr>         
                <tr>
                     <td>Purchase rate:</td><td> <asp:textbox id="Purchaserate" AutoCompleteType="Disabled" Textmode="Number" runat="server"></asp:textbox></td>   
                </tr>
               <tr>
                    <td><asp:Button ID="save" runat="server" Text="Save" OnClick="save_click" ></asp:Button></td>
                   <td><asp:Button ID="delete" runat="server" Text="Delete" Visible="false" OnClick="delete_click" ></asp:Button></td>
                   <td><asp:Button ID="refresh" runat="server" Text="Refresh" OnClick="refresh_click" ></asp:Button></td>
                </tr>             
            </table> 
          </fieldset> --%>
        
    </form>
    
</body>
</html>
