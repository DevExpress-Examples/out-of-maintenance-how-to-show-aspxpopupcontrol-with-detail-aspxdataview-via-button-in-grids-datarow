using System;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxDataView;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxCallbackPanel;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
    }
    protected void ASPxButton1_Init(object sender, EventArgs e) {
        ASPxButton button = (ASPxButton)sender;
        GridViewDataRowTemplateContainer templateContainer = (GridViewDataRowTemplateContainer)button.NamingContainer;
        button.ClientSideEvents.GotFocus = string.Format("function(s, e) {{ OnGotFocusEventHander(s, e, {0}); }}", templateContainer.KeyValue);
    }
    protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e) {
        Session["CategoryID"] = e.Parameter;

        ASPxCallbackPanel panel = (ASPxCallbackPanel)sender;

        ASPxDataView dataView = (ASPxDataView)panel.FindControl("ASPxDataView1");
        dataView.DataBind();
    }
}