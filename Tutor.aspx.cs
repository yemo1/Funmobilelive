using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace F2
{
    public partial class Tutor : System.Web.UI.Page
    {
        protected string MyTutor = WebConfigurationManager.ConnectionStrings["MyTutor"].ConnectionString;
        int totalChecked = 0;
        protected string details = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            Alert.Visible = false;
            txtSubject.Visible = false;
            string subjects = "SELECT SubjectID,SubjectName from SubjectArea";
            if (!IsPostBack)
            {
                ddlSex.Items.Add("Male");
                ddlSex.Items.Add("Female");
                rptSubject.DataSource = getCategory(MyTutor, subjects);
                rptSubject.DataBind();
            }
        }

        public static DataTable getCategory(string strConn, string query, string param = "")
        {
            DataTable subjects = new DataTable();
            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", param);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(subjects);
                }
            }
            return subjects;
        }

        public static string AddTutor(string strConn, string query, int subjectId, string firstname, string lastname, string email, string phone, string sex,string occupation, string address,string details="")
        {

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@subjectid", subjectId);
                cmd.Parameters.AddWithValue("@firstname", firstname);
                cmd.Parameters.AddWithValue("@lastname", lastname);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@occupation", occupation);
                cmd.Parameters.AddWithValue("@sex", sex);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@details", details);
                cmd.ExecuteNonQuery();
            }
            return query;

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string query = "INSERT INTO Trainer(Firstname,Lastname,Email,Phone,Sex,Occupation,Address,SubjectId,Details)VALUES(@firstname,@lastname,@email,@phone,@sex,@occupation,@address,@subjectid,@details)";
            //if (txtS
            //{
            //    details = txtSubject.Text.Trim();
            //    AddTutor(MyTutor, query, 0, txtFName.Text, txtLName.Text, txtMail.Text, txtPhone.Text,txtOccupy.Text, ddlSex.SelectedItem.Text, txtAddress.Text, details);
            //}
            //string query = "INSERT INTO Trainer (Firstname,Lastname,Email,Phone,Sex,Address,SubjectId,Details)VALUES(@firstname,@lastname,@email,@phone,@sex,@address,@subjectid,@details)";
            foreach (RepeaterItem items in rptSubject.Items)
            {
                CheckBox chk = (CheckBox)items.FindControl("chkSubject");
                if (chk != null && chk.Checked )
                {
                    totalChecked++;
                }
                if (chk.Checked && chk.Text != "Others")
                {
                    HiddenField hdf = (HiddenField)items.FindControl("hdfId");
                    int subId = Convert.ToInt32(hdf.Value);
                    AddTutor(MyTutor, query, subId, txtFName.Text, txtLName.Text, txtMail.Text, txtPhone.Text, ddlSex.SelectedItem.Text,txtOccupy.Text, txtAddress.Text);
                }
                else if (chk.Checked && chk.Text == "Others")
                {
                    details = txtSubject.Text;
                    AddTutor(MyTutor, query, 0, txtFName.Text, txtLName.Text, txtMail.Text, txtPhone.Text, ddlSex.SelectedItem.Text,txtOccupy.Text, txtAddress.Text, details);
                }
            }
            if (totalChecked == 0)
            {
                Alert.Visible = true;
                alerts.Attributes["class"] = "alert alert-warning";
                lblMessage.Text = "You must select at least one subject from the subject area.";
            }
            else
            {
                Alert.Visible = true;
                alerts.Attributes["class"] = "alert alert-success";
                lblMessage.Text = "Thank you for submitting your profile. We will contact you if necessary";
                clearData();
            }
        }

        protected void chkSubject_CheckedChanged(object sender, EventArgs e)
        {
            foreach (RepeaterItem items in rptSubject.Items)
            {
                CheckBox chk = (CheckBox)items.FindControl("chkSubject");
                if (chk.Checked && chk.Text == "Others")
                {
                    txtSubject.Visible = true;
                }
            }

            //for (int i = 0; i < rptSubject.Items.Count; i++)
            //{
            //    int iCheck = 0;
            //    //iCheck = rptSubject.Items[i].FindControl("chkSubject");
            //    CheckBox chk = (CheckBox)rptSubject.Items[i].FindControl("chkSubject");
            //    if (chk.Checked )
            //    {
            //        totalChecked++;
            //    }
            //}
            //foreach (RepeaterItem items in rptSubject.Items)
            //{
            //    CheckBox chk = (CheckBox)items.FindControl("chkSubject");
            //    if ( chk != null &&  chk.Checked)
            //    {
            //        totalChecked ++;
            //    }
               
            //}
        }

        //protected void chkOthers_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (chkOthers.Checked)
        //    {
        //        txtSubject.Visible = true;
        //    }
        //    else
        //    {
        //        txtSubject.Visible = false;
        //    }
        //}

        protected void clearData()
        {
            txtFName.Text = string.Empty;
            txtLName.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtMail.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtOccupy.Text = string.Empty;
            foreach (RepeaterItem items in rptSubject.Items)
            {
                CheckBox chk = (CheckBox)items.FindControl("chkSubject");
                chk.Checked = false;
            }
        }
    }
}