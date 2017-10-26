using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace F2
{
    public partial class SmsVideo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Image img = (Image)fmvContent.FindControl("Image1");
            Image img1 = (Image)fmvContent.FindControl("Image2");
            if (string.IsNullOrEmpty(img.ImageUrl))
            {
                img.Visible = false;
            }
            if (string.IsNullOrEmpty(img1.ImageUrl))
            {
                img1.Visible = false;
            }
        }
    }
}