<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="DynamicPage.aspx.cs" Inherits="F2.DynamicPage" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding:25px">
        <div class="myform">
            <asp:Label ID="Label1" runat="server" Text="Title" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtTitle" runat="server" placeholder="Title"></asp:TextBox>
        </div>
        <div class="myform">
            <asp:Label ID="Label2" runat="server" Text="Content Header" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtHeader" runat="server" placeholder="Content Header"></asp:TextBox>
        </div>
        <div class="myform">
            <asp:Label ID="Label5" runat="server" Text="Page Url" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtUrl" runat="server" placeholder="Url"></asp:TextBox>
        </div>
        <div class="myform">
            <asp:Label ID="Label6" runat="server" Text="Content" CssClass="label"></asp:Label>
           <CKEditor:CKEditorControl ID="CKEditor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
        </div>
        <div class="myform">
            <asp:Label ID="Label3" runat="server" Text="Image 1" CssClass="label"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </div>
        <div class="myform">
            <asp:Label ID="Label4" runat="server" Text="Image 2" CssClass="label"></asp:Label>
            <asp:FileUpload ID="FileUpload2" runat="server" />
        </div>
        <div class="myform">
            <asp:Button ID="btnAdd" runat="server" Text="Add Content" OnClick="btnAdd_Click" />
        </div>
    </div>
</asp:Content>
