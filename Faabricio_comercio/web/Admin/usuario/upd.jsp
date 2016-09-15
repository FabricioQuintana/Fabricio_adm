
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../cabecalho.jsp" %>
<%

    if (request.getParameter("login") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String msg = "teste";
    String classe = "alert-danger";

    UsuarioDAO dao = new UsuarioDAO();
    Usuario obj = new Usuario();

    obj = dao.buscarPorChavePrimaria(request.getParameter("login"));
    if (obj == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    if (request.getMethod().equals("POST")) {

        obj.setSenha(request.getParameter("senha"));
        Boolean resultado = dao.alterar(obj);
        if (resultado) {
            msg = "Registo alterado com sucesso";
            classe = "alert-success";
        } else {
            msg = "Não foi possivel alterar";
            classe = "alert-danger";
        }

    }

%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Comércio Eletrônico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conteúdo de apresentação
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Usuario
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Login</label>
                        <input class="form-control" type="text" readonly  value="<%=obj.getLogin()%>"  />
                    </div>

                    <div class="form-group">
                        <label>Senha</label>
                        <input name="senha" class="form-control" type="text" required value="<%=obj.getSenha()%>" />
                    </div>



                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>