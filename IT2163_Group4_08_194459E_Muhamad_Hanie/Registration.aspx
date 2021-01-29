<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="IT2163_Group4_08_194459E_Muhamad_Hanie.Registration" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <title>My Registration</title>
    <script type="text/javascript">
        function validate() {
            var str = document.getElementById('<%=tb_password.ClientID %>').value;

            if (str.length < 8) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password Length Must be at Least 8 Characters";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("too short");
            }

            else if (str.search(/[0-9]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password require at least 1 number";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_number");
            }

            else if (str.search(/[A-Z]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password require at least 1 Uppercase Character";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_number");
            }

            else if (str.search(/[a-z]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password require at least 1 Lowercase Character";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_number");
            }

            else if (str.search(/[^A-Za-z0-9]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password require at least 1 Uppercase Character";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_number");
            }

            document.getElementById("lbl_pwdchecker").innerHTML = "Excellent";
            document.getElementById("lbl_pwdchecker").style.color = "Blue";
        }

    </script>

    <style type="text/css">
        .auto-style1 {
            width: 291px;
        }

        .auto-style2 {
            width: 52%;
            margin-left: 400px;
        }

        .auto-style6 {
            width: 581px;
        }

        .auto-style7 {
            height: 26px;
            width: 581px;
        }

        .auto-style8 {
            width: 291px;
            height: 26px;
        }

        .auto-style9 {
            width: 77px;
        }

        .auto-style10 {
            width: 77px;
            height: 26px;
        }
        body {
            background-image: url('images/register.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
        }
        .auto-style11 {
            margin-left: 400px;
        }
        .auto-style12 {
            width: 291px;
            height: 34px;
        }
        .auto-style13 {
            width: 581px;
            height: 34px;
        }
        .auto-style14 {
            width: 77px;
            height: 34px;
        }
        .auto-style15 {
            width: 291px;
            height: 25px;
        }
        .auto-style16 {
            width: 581px;
            height: 25px;
        }
        .auto-style17 {
            width: 77px;
            height: 25px;
        }
    </style>

    <script src="https://www.google.com/recaptcha/api.js?render=6LfabykaAAAAACzeAZ4ZZf1ja1Pi_uOjaK5gyb9L"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2 class="auto-style11">Account Registration</h2>
            <p>&nbsp;</p>
        </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lbRegistration" runat="server" Text="Email (UserId)"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="tb_email" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_email" ErrorMessage="Please fill up Email" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tb_email" Display="Dynamic" ErrorMessage="Please enter a valid email address." ForeColor="Red" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lbPassword" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="tb_password" runat="server" TextMode="Password" onkeyup="javascript:validate()"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_password" ErrorMessage="Please fill up Password" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tb_password" Display="Dynamic" ErrorMessage="Please use proper characters." ForeColor="Red" ToolTip="E.g. &lt;,/,&gt; are known bad characters in the" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&amp;]).{8,}$"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                </td>
                <td class="auto-style16">
                    <asp:Label ID="lbl_pwdchecker" runat="server"></asp:Label>
                </td>
                <td class="auto-style17"></td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lb_ConfirmationPassword" runat="server" Text="Confirmation Password"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="tb_confirmation_password" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" BorderColor="Black" ControlToCompare="tb_password" ControlToValidate="tb_confirmation_password" Display="Dynamic" ErrorMessage="No Match" ForeColor="Red" ToolTip="Password must be the same"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tb_confirmation_password" ErrorMessage="Please fill up Confirmation password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8"></td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lb_CreditCard" runat="server" Text="Credit Card"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="tb_creditcard" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tb_creditcard" ErrorMessage="Please fill up Credit Card" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="tb_creditcard" Display="Dynamic" ErrorMessage="The card number is invalid" ForeColor="Red" ValidationExpression="^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lb_FirstName" runat="server" Text="First Name"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="tb_FirstName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tb_FirstName" ErrorMessage="Please fill up First Name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lb_LastName" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="tb_LastName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tb_LastName" ErrorMessage="Please fill up Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12">
                    <asp:Label ID="lb_DateofBirth" runat="server" Text="Date of Birth"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:TextBox ID="tb_DateofBirth" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tb_DateofBirth" ErrorMessage="Please fill up Date of Birth" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style14"></td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="btnCheckPassword" runat="server" causesvalidation="False" ValidationGroup="valGroup2" OnClick="btnCheckPassword_Click" Text="Check Password Complexity" Width="218px" />
                </td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style9">
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" Width="158px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Label ID="lbl_error" runat="server"></asp:Label>
                    <asp:Label ID="lb_error1" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style6">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tb_password" ErrorMessage="Password Complexity - Weak" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&amp;])[A-Za-z\d$@$!%*?&amp;]{8,10}"></asp:RegularExpressionValidator>
                    &nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
              <asp:Label ID="Lbl_error1" runat="server"></asp:Label>
        </table>
    </form>
    <script>
        grecaptcha.ready(function () {
            grecaptcha.execute(' 6LfabykaAAAAACzeAZ4ZZf1ja1Pi_uOjaK5gyb9L ', { action: 'Login' }).then(function (token) {
                document.getElementById("g-recaptcha-response").value = token;
            });
        });
    </script>
</body>
</html>
