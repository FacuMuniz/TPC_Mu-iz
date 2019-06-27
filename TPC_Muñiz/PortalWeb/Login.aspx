<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PortalWeb.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Gestion de Restaurante</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="assets/Login.css?v=1" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="header-container d-flex flex-direction-column">
            <label class="header">GDR</label>
            <label class="sub-header">Gestión de Restaurant</label>
        </div>
        <div class="logo-container d-flex justify-content-center">
            <div class="d-flex flex-direction-column">
                <span class="user-logo d-flex justify-content-center">
                    <i class="fas fa-user-circle"></i>
                </span>
                <div class="input-container d-flex flex-direction-column">
                    <div class="d-flex justify-content-center">
                        <input type="text" class="" placeholder="Email" runat="server" id="user"/>
                        <div class="square-end">
                            <span class="square-end-inner">
                                <i class="fas fa-envelope"></i>
                            </span>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center password">
                        <input type="password" class="" placeholder="Contraseña" runat="server" id="password"/>
                        <div class="square-end">
                            <span class="square-end-inner">
                                <i class="fas fa-lock"></i>
                            </span>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center">
                        <input type="button" class="login-btn" value="Iniciar sesión" runat="server" id="btnLogin" onserverclick="btnLogin_ServerClick"/>
                    </div>
                   
                </div>
            </div>
        </div>
    </form>
</body>
</html>
