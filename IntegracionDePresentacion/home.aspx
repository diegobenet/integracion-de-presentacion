<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="IntegracionDePresentacion.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="css" runat="server">
    <style>
        h1 {
            font-size: 5vw;
            font-weight: bolder;
            color: white;
        }

        h2 {
            font-size: 2.2vw;
            color: white;
        }

        .banner {
            height: 100vh;
            width: 100%;
            background: url('as/im/background.png');
            background-size: cover;
            position:absolute;
            background-position: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner container-fluid">
        <div style="margin-top: 120px; margin-left: 50px">
            <h1>Bienvenido</h1>
            <h2 style="max-width: 450px; margin-top: 30px">Obtén la información de tu ordenador aquí!!</h2>
            <a href="infoOrdenador">
                <button type="button" class="btn btn-lg" style="width: 150px; height: 55px; margin-top: 30px; border: 3px solid #b68658; background-color:white; border-radius:15px" onclick="load()">
                    <span id="buttonLabel">Obtener</span>
                    <div id="buttonSpinner" class="spinner-border m-2" role="status" style="width: 1.5rem; height: 1.5rem; display: none">
                        <span class="sr-only">Loading...</span>
                    </div>
                </button>
            </a>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script>
        function load() {
            $('#buttonLabel').hide();
            $('#buttonSpinner').show();
        }
    </script>
</asp:Content>
