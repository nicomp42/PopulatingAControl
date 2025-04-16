using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PopulatingAControl
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the page request is a postback
            if (IsPostBack)
            {
                // Retrieve the control ID that caused the postback
                // __EVENTTARGET stores the UniqueID of the control passed to __doPostBack
                string eventTarget = Request.Form["__EVENTTARGET"];

                // Retrieve the argument passed to __doPostBack
                // __EVENTARGUMENT stores the second argument passed to __doPostBack
                string eventArgument = Request.Form["__EVENTARGUMENT"];

                // Check if the postback was triggered by our ListBox double-click handler
                if (eventTarget == lbNames.ID && eventArgument != null && eventArgument.StartsWith("DoubleClick:"))
                {
                    // Extract the value passed in the argument
                    string doubleClickedValue = eventArgument.Substring("DoubleClick:".Length);

                    // Find the corresponding item text (optional, if needed)
                    System.Web.UI.WebControls.ListItem item = lbNames.Items.FindByValue(doubleClickedValue);
                    string doubleClickedText = (item != null) ? item.Text : "Unknown Item";

                    // --- Your Server-Side Logic Here ---
                    // Execute the code you want to run on double-click
                    Label1.Text = lbNames.Text;

                    // Example: Redirect, update database, perform calculation, etc.
                    // Response.Redirect($"DetailsPage.aspx?item={doubleClickedValue}");
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // click event handler for the button
            // Copy the selected item from the
            //  list box into the label
            Label1.Text = lbNames.Text;
        }

        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            // Runs when the user clicks cmdAdd
            lbNames.Items.Add(txtNewItem.Text);
        }

        protected void lbNames_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}