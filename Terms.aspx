<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Terms.aspx.cs" Inherits="F2.Terms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main" class="row" role="main">
        <div class="twelve columns">
            <div class="row">
                <article class="entry twelve columns">
					<div class="container shd">
                        <div>
						<te:Terms id="myTerms" runat="Server" />
                            </div>
					</div>
            </article>
				<!-- #sidebar -->
        </div>
    </div>
    </div>
</asp:Content>
