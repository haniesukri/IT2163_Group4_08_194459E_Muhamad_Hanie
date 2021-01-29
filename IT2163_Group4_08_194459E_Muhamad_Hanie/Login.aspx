<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IT2163_Group4_08_194459E_Muhamad_Hanie.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 270px;
        }

        .auto-style2 {
            width: 270px;
            height: 25px;
        }

        .auto-style3 {
            height: 25px;
        }

        body {
            background-image: url('images/login.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
        }

        .auto-style4 {
            margin-left: 520px;
        }
        .auto-style5 {
            width: 100%;
        }
    </style>
    <script src="https://www.google.com/recaptcha/api.js?render=6LfabykaAAAAACzeAZ4ZZf1ja1Pi_uOjaK5gyb9L"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style4">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            Login Page<br />
            <br />
            <table class="auto-style5">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="lbEmail" runat="server" Text="User ID/Email"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tb_userid" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_userid" Display="Dynamic" ErrorMessage="Please fill up this field" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tb_userid" Display="Dynamic" ErrorMessage="Please enter a valid email address." ForeColor="Red" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="lbPassword" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tb_pwd" runat="server" TextMode="Password"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_pwd" ErrorMessage="Please fill up this field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Login" Width="168px" />
                        <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label>
                        <br />
                        <br />                                    
                        <asp:Button ID="btn_newUser" runat="server" causesvalidation="False" ValidationGroup="valGroup2" ForeColor="#0066FF" OnClick="btnNewUser_Click" Text="New user?" BorderColor="White" BorderStyle="None" />
                        <input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
   
    <script>
        grecaptcha.ready(function () {
            grecaptcha.execute(' 6LcYtuUZAAAAAO8JnY3JzmmEzto1BroznbiHwUuW ', { action: 'Login' }).then(function (token) {
                document.getElementById("g-recaptcha-response").value = token;
            });
        });
    </script>
</body>
</html>

