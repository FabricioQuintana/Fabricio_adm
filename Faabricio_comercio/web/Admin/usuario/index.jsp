

<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>

<%@page import="dao.UsuarioDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    UsuarioDAO dao = new UsuarioDAO();
    List<Usuario> lista;

    lista = dao.listar();

    lista = dao.listar();
    if (request.getParameter("filtro") != null) {

        lista = dao.filtro(request.getParameter("filtro"));
    } else {
        lista = dao.listar();
    }

    if (request.getParameter("login") != null) {
        Usuario obj = dao.buscarPorChavePrimaria(request.getParameter("login"));
        if (obj != null) {
            Boolean funcionou = dao.excluir(obj);
            if (funcionou) {
                //vai ter uma janela
            }
        }
    }
%>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Usuarios

        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">listagem</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> listagem de registros
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">

        <div class="panel-body">

            <a href="add.jsp" class="btn  btn-primary btn-sm fa fa-plus-square-o" >Novo</a>


        </div>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text" class="form-control" placeholder="digite...">
                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
            </div>
        </form>
        <div class="panel-body">


            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Login</th>
                            <th>Senha</th>
                            <th >A��es</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Usuario item : lista) {

                        %>
                        <tr>
                            <td><%=item.getLogin()%></td>
                            <td><%=item.getSenha()%></td>
                            <td><a href="upd.jsp?login=<%=item.getLogin()%>" class="btn  btn-primary btn-sm">Alterar</a>
                                <a href="index.jsp?login=<%=item.getLogin()%>" class="btn  btn-primary btn-sm">Excluir</a>  

                            </td>
                        </tr>

                        <%
                            }
                        %>

                    </tbody>
                </table>

                <!-- /.table-responsive -->
            </div>

        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
</div>
<%@include file="../rodape.jsp" %>
