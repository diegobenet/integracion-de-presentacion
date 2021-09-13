<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="infoOrdenador.aspx.cs" Inherits="IntegracionDePresentacion.infoOrdenador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Información</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="css" runat="server">
    <style>
        h1 {
            font-size: 3vw;
            font-weight: bold;
        }

        .banner {
            top: 0px;
            left: 0px;
            right: 0px;
            width: 20%;
            height: 100vh;
            background-size: cover;
            background-position: center;
            background-image: url("as/im/background2.jpg");
        }

        table, th, td {
            border: 1px solid #b68658;
        }

        th, td {
            padding-left: 20px;
            font-size: 1.3vw;
        }

        tr {
            height: 35px;
        }

        th {
            max-width: 110px;
        }

        .table td {
            padding-left: 40px;
        }

        .tabla {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex">
        <div class="banner" style="max-width: 85px; height: 721px;"></div>
        <div class="container-fluid">
            <div style="margin-top: 80px; margin-left: 35px; margin-right: 50px">
                <h1 style="max-width: 650px; margin-bottom: 45px">Esta es la información de su ordenador:</h1>
                <table class="tabla">
                    <tbody>
                        <tr>
                            <th scope="row" style="">Id. del producto</th>
                            <td><%=dato[0] %></td>
                        </tr>
                        <tr style="background-color: #98c495">
                            <th scope="row">Modelo del sistema</th>
                            <td><%=dato[1] %></td>
                        </tr>
                        <tr>
                            <th scope="row" style="">Tipo de sistema</th>
                            <td><%=dato[2] %></td>
                        </tr>
                        <tr style="background-color: #98c495">
                            <th scope="row">Propiedad de</th>
                            <td><%=dato[3]%></td>
                        </tr>
                        <tr>
                            <th scope="row" style="">Nombre de host</th>
                            <td><%=dato[4] %></td>
                        </tr>
                        <tr style="background-color: #98c495">
                            <th scope="row">Zona horaria</th>
                            <td><%=dato[5] %></td>
                        </tr>
                        <tr>
                            <th scope="row" style="">Versión de BIOS</th>
                            <td><%=dato[6] %></td>
                        </tr>
                        <tr style="background-color: #98c495">
                            <th scope="row">Memoria física (RAM)</th>
                            <td><%=dato[7]%></td>
                        </tr>
                    </tbody>
                </table>
                <div class="d-flex align-items-center" style=" margin-top: 50px;">
                    <button type="button" class="btn btn-lg" style="width: 150px; height: 55px; border: 3px solid #b68658; background-color: white; border-radius: 15px" onclick="saveFile()">
                        <span id="buttonLabel">Guardar</span>
                    </button>
                    <div style="margin-left: 50px">
                        <input type="text" class="form-control" style="height: 55px; width: 800px; text-align:center; font-size: 1.3vw; border: 2px solid black; border-radius: 15px; max-width: 80%" id="dir" aria-describedby="dirHelp" placeholder="Ingresar la ruta donde se guardará la información">
                    </div>
                </div>
                <div class="alert" style="display: none; margin-top: 20px" id="mensaje" role="alert">
                    <strong id="estado"></strong>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script>
        function saveFile() {
            var dir = $('#dir').val();
            var data = JSON.stringify({ dir: dir })
            $('#dir').val("");
            $.ajax({
                type: "POST",
                url: "infoOrdenador.aspx/saveFile",
                data: data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function (response) {
                    console.log(response.d);

                    if (response.d == "Error") {
                        $("#mensaje").removeClass("alert-success").addClass("alert-danger");
                        $("#estado").text("Ruta invalida");
                        $("#mensaje").show();
                    } else {
                        $("#mensaje").removeClass("alert-danger").addClass("alert-success");
                        $("#estado").text("Archivo creado Exitosamente");
                        $("#mensaje").show().delay(1800).fadeOut();
                    }
                },
                failure: function (response) {
                    //alert(response.d);
                    toast = '<span class="toast-yellow">Se produjo un error, intenta de nuevo<span>';
                    M.toast({ html: toast });

                }
            });
        }
    </script>
</asp:Content>
