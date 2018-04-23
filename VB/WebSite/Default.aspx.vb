Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxDataView
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxCallbackPanel

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub
	Protected Sub ASPxButton1_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim button As ASPxButton = CType(sender, ASPxButton)
		Dim templateContainer As GridViewDataRowTemplateContainer = CType(button.NamingContainer, GridViewDataRowTemplateContainer)
		button.ClientSideEvents.GotFocus = String.Format("function(s, e) {{ OnGotFocusEventHander(s, e, {0}); }}", templateContainer.KeyValue)
	End Sub
	Protected Sub ASPxCallbackPanel1_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
		Session("CategoryID") = e.Parameter

		Dim panel As ASPxCallbackPanel = CType(sender, ASPxCallbackPanel)

		Dim dataView As ASPxDataView = CType(panel.FindControl("ASPxDataView1"), ASPxDataView)
		dataView.DataBind()
	End Sub
End Class