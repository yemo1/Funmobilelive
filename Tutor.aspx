<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Tutor.aspx.cs" Inherits="F2.Tutor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div class="form-horizontal">
            <div class="row">
                <div id="Alert" class="col-lg-12" runat="server">
                    <div id="alerts" runat="server" class="alert alert-success" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label ID="lblMessage" runat="server" Text="Thank you for submitting your profile. We will contact you if necessary"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <p class="page-header text-danger">The Voice Tutor is a tool that enables you reach out to help other people overcome academic, social and personal problems. The anonymous nature of the tool makes it easy to speak with a professional in confidence.<br /> 
                        To register free as a teacher, coach or counsellor, please fill the form below: </p>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <div class="row">
                <div class=" col-lg-6 col-md-6 col-sm-6">
                    <div class="form-group">
                        <asp:Label ID="lblFName" runat="server" Text="First Name"></asp:Label>
                        <asp:TextBox ID="txtFName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqFName" runat="server" ErrorMessage="[Enter your first name]" ControlToValidate="txtFName" Display="Dynamic" ValidationGroup="Error" CssClass="text-danger small"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Last Name"></asp:Label>
                        <asp:TextBox ID="txtLName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqLName" runat="server" ErrorMessage="[Enter your last name]" ControlToValidate="txtLName" Display="Dynamic" ValidationGroup="Error" CssClass="text-danger small"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="txtMail" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqMail" runat="server" ErrorMessage="[Enter your email]" ControlToValidate="txtMail" Display="Dynamic" ValidationGroup="Error" CssClass="text-danger small"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegMail" runat="server" ErrorMessage="[Enter a valid emaiil]" ControlToValidate="txtMail" Display="Dynamic" ValidationGroup="Error" CssClass="text-danger small" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" Text="Phone"></asp:Label>
                        <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqPhone" runat="server" ErrorMessage="[Enter your phone number]" ControlToValidate="txtPhone" Display="Dynamic" ValidationGroup="Error" CssClass="text-danger small"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" Text="Sex"></asp:Label>
                        <asp:DropDownList ID="ddlSex" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label5" runat="server" Text="Current Occupation"></asp:Label>
                        <asp:TextBox ID="txtOccupy" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqOccupation" runat="server" ErrorMessage="[Enter your occupation]" ControlToValidate="txtOccupy" Display="Dynamic" ValidationGroup="Error" CssClass="text-danger small"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label6" runat="server" Text="Address"></asp:Label>
                        <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" Rows="6" Columns="24" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqAddress" runat="server" ErrorMessage="[Enter your address]" ControlToValidate="txtAddress" Display="Dynamic" ValidationGroup="Error" CssClass="text-danger small"></asp:RequiredFieldValidator>
                    </div>
                    <asp:Button ID="btnAdd" runat="server" Text="Add Tutor" CssClass="btn btn-primary" ValidationGroup="Error" OnClick="btnAdd_Click" />
                </div>

                <div class="col-lg-5 col-md-5 col-sm-5 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            Subject Area
                        </div>
                        <div class="panel-body">
                             <div>
                                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Enter subject here"></asp:TextBox>
                            </div>
                            <asp:Repeater ID="rptSubject" runat="server">
                                <ItemTemplate>
                                    <div class="checkbox">
                                        <label>
                                            <asp:CheckBox ID="chkSubject" CssClass="checkbox" runat="server" Text='<%#Eval("SubjectName") %>' OnCheckedChanged="chkSubject_CheckedChanged" AutoPostBack="true" />
                                            <asp:HiddenField ID="hdfId" runat="server" Value='<%#Eval("SubjectID") %>' />
                                        </label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <%--<div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="chkOthers" CssClass="checkbox" runat="server" Text="Others" OnCheckedChanged="chkOthers_CheckedChanged" AutoPostBack="true" />
                                </label>
                            </div>--%>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <%-- <script type="text/javascript">
        $(function() {
            var $txt = $('input[id$=txtSubject]');
            var $chk = $('input:checkbox[id$=chkSubject]');
            // check on page load
            checkChecked($chk);
            $chk.click(function() {
                checkChecked($chk);
            });
            
            function checkChecked(chkBox) {
                if (chkBox.is(":checked")) {
                    $btn.removeAttr('disabled');
                } else {
                    $btn.attr('disabled', 'disabled');
                }
            }
        });
    </script>--%>
</asp:Content>
