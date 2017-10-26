<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Partners.aspx.cs" Inherits="F2.Partners" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="hero" style="background: url(images/dummy/hero-plain.jpg) center no-repeat;">
		<h1>Partners</h1>
	</section>
	<div id="main" class="row" role="main">
		<div class="twelve columns">
			<div class="row">
				<article class="entry twelve columns">
				<div class="container shd">

					<!--<figure class="entry-thumb">
						<a href="images/dummy/thumb.jpg" class="fancybox"><img src="images/dummy/thumb.jpg" alt=""></a>
					</figure>-->

				
				 
				  Fun Mobile has a number of partner companies whose content we aggregate and who act as Aggregators for some of our content. These partner companies include TA Telecoms, Comviva, Melodi Media, Bella Naija and OnMobile.

					We get majority of our content directly from the artists through their managers making sure we sign appropriate contracts that give us permission to use said content nationally and globally and we have in place a system of reconciling content used each month so that we compensate the artists in a fair manner according to the terms of the contract signed.

					Our providers of technical support are our in-house technical team.

					Some of our partners include:
                    <div style="margin-top:3em">
                        <asp:Image ID="imgPartners" runat="server" ImageUrl="~/images/fun-partners.jpg" />
                    </div>
			        
				</div>
			</article>
				<!-- #sidebar -->
			</div>
		</div>
	</div>
</asp:Content>
