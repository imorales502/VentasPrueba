<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IngresoInventario.aspx.cs" Inherits="VentasMariscos.Forms.IngresoInventario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>
    <asp:UpdatePanel ID="PanelPrincipal" runat="server">
        <ContentTemplate>
            <section class="content-header">
                <h1>Ingreso de Mercadería</h1>
            </section>
            <section class="content">
                <div class="container-fluid">
                    <div class="box-body"/>
                    <asp:MultiView ID="MultiView" runat="server">
                        <asp:View ID="ViewFiltro" runat="server">
                            <div class="row">

                            </div>
                        </asp:View>
                        <asp:View ID="ViewTecleo" runat="server">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-primary">
                                        <div class="card-header">
                                            <center>
                                                <h3 class="card-title">Ingreso de inventario</h3>
                                            </center>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <asp:Label Text="Fecha"></asp:Label>
                                                        <asp:TextBox ID="TxtFecha" runat="server" CssClass="form-control input-lg" Width="100%" TextMode="Date" BackColor="#FFFFCC"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </div>
            </section>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenScriptBody" runat="server">
</asp:Content>
