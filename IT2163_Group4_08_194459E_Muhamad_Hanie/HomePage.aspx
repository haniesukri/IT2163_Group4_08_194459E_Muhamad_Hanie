<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="IT2163_Group4_08_194459E_Muhamad_Hanie.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <fieldset>
            <legend>Homepage</legend>
            <asp:Label ID="lblMessage" runat="server" EnableViewState="false"></asp:Label>
            <asp:Button ID="btn_logout" runat="server" Text="logout" OnClick="LogoutMe" Visible="false" />
        </fieldset>
    </div>
    <p>
        &nbsp;
    </p>
</asp:Content>
