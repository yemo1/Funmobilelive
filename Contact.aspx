<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="F2.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="hero" style="background: url(images/dummy/hero-plain.jpg) center no-repeat;">
		<h1>Contact Us</h1>
	</section>
	<div id="main" class="row" role="main">
		<div class="twelve columns">
			<div class="row">
				<article class="entry twelve columns">
					<div class="container shd">
						<div style="overflow:hidden">
							<h2 style="font-family:'Comic Sans MS'">We Value Feedback</h2>
							 <div class="map">
								<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15858.952944787874!2d3.4316943999998606!3d6.427666364603025!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNsKwMjUnMzkuNiJOIDPCsDI1JzU0LjEiRQ!5e0!3m2!1sen!2sng!4v1409304453775" width="600" height="450" frameborder="0" style="border: 0"></iframe>
							</div>
							<div class="address">
								<p class="contactBar1">
									No. 2A, A.J Marinho Drive,<br />
									Off Sinari Daranijo
									<br />
									Street, Victoria Island.
									<br />
									Lagos, Nigeria
								</p>

								<p class="contactBar2">
									ask@funmobilelive.com
								</p>

								<p class="contactBar3">
									234-1-271-1730
								</p>
								<div class="contact-form">
									<asp:RequiredFieldValidator ID="reqName" runat="server" ErrorMessage="Name is required" Display="Dynamic" CssClass="error" 
										ControlToValidate="txtName" ValidationGroup="Send"></asp:RequiredFieldValidator>
									<asp:TextBox ID="txtName" runat="server" CssClass="user"
										PlaceHolder="Name"></asp:TextBox>
									<asp:RequiredFieldValidator ID="reqMail" runat="server" ErrorMessage="Email is required" Display="Dynamic" CssClass="error" 
										ControlToValidate="txtMail" ValidationGroup="Send"></asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="validMail" runat="server" ErrorMessage="Email is not valid" CssClass="error" 
										ControlToValidate="txtMail" ValidationGroup="Send" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
									<asp:TextBox ID="txtMail" runat="server" CssClass="email" TextMode="Email"
										PlaceHolder="Email Address"></asp:TextBox>
									<asp:RequiredFieldValidator ID="reqMessage" runat="server" ErrorMessage="Enter your message please" Display="Dynamic" CssClass="error" 
										ControlToValidate="txtMessage" ValidationGroup="Send"></asp:RequiredFieldValidator>
									<asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="8" Columns="40"
										PlaceHolder="Your Message Goes Here"></asp:TextBox>
									<asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" ValidationGroup="Send" />
								</div>
							</div>
						</div>
					</div>
				</article>
			</div>
		</div>
	</div>
</asp:Content>
