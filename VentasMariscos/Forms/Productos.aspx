<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="VentasMariscos.Forms.Ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="PanelPrincipal" runat="server">
        <ContentTemplate>
            <section class="content-header">
                <h1>Ingreso de productos</h1>
            </section>
            <section class="content">
                <div class="container-fluid">
                    <div class="box-body">
                        <asp:MultiView ID="MultiView" runat="server">
                            <asp:View ID="ViewIngreso" runat="server">
                                <div class="card-body">
                                    <div class="row">
                                        <div class=<%--"col-md-3">
                                            <div class="form-group">
                                                <asp:Label Text="Fecha" runat="server" />
                                                <asp:TextBox ID="TxtFecha" runat="server" CssClass="form-control input-lg" Width="100%" TextMode="Date"></asp:TextBox>
                                            </div>
                                        </div>--%>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <asp:Label Text="Id Producto" runat="server"></asp:Label>
                                                <asp:TextBox ID="TxtIdProducto" runat="server" CssClass="form-control select2" Width="100%" AutoPostBack="true" MaxLength="5" TextMode="Number"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label Text="Nombre Producto" runat="server"></asp:Label>
                                                <asp:TextBox ID="TxtNombreProducto" runat="server" CssClass="form-control select2" Width="100%" B MaxLength="40"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <br />
                                                <asp:LinkButton ID="CmdBuscar" runat="server" CssClass="btn btn-default" Width="100%" OnClick="CmdBuscar_Click"><li class="fa fa-search">Buscar</li></asp:LinkButton>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <br />
                                                <asp:LinkButton ID="CmdAgregar" runat="server" CssClass="btn btn-primary" Width="100%">Grabar Nuevo</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h3 class="card-title">Productos</h3>
                                            </div>
                                            <div class="card-body table-responsive">
                                                <asp:GridView ID="GrdProductos" runat="server" CssClass="table table-bordered " AutoGenerateColumns="false">
                                                    <Columns>
                                                        <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="id" />
                                                        <asp:BoundField DataField="Nombre" HeaderText="Descripción" SortExpression="desc" />
                                                        <asp:BoundField DataField="Precio" HeaderText="Precio producto" SortExpression="prec" />
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                            <div class="card-footer clearfix">
                                            <asp:Label ID="LblRegistros" Text="" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </asp:View>
                        </asp:MultiView>
                    </div>
                </div>
            </section>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenScriptBody" runat="server">
</asp:Content>
