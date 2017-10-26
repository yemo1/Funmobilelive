<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Notfound.aspx.cs" Inherits="F2.Notfound" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="main" class="row" role="main">
        <div class="twelve columns">
            <div class="row">
                <article class="entry twelve columns">
					<div class="container shd">
						<h2>Sorry!</h2>
                        <hr/>
                        You are trying to view either a URL that is not reachable or has been changed.
                        <ul>
                            <li> Go to the <a href="../Default"><span style="color:maroon">Homepage</span></a></li>
                            <li> If you will like to reach out, visit our <a href="../Contact"><span style="color:maroon">Contact Page</span></a></li>
                            <li> You can also type and search the page you are looking for below:</li>
                        </ul>
					</div>
				</article>
                <!-- #sidebar -->
            </div>
        </div>
    </div>
</asp:Content>
