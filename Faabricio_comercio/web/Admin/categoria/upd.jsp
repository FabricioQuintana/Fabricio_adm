
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cabecalho.jsp" %>
<%

    if (request.getParameter("codigo") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String msg = "teste";
    String classe = "alert-danger";

    CategoriaDAO dao = new CategoriaDAO();
    Categoria obj = new Categoria();

    obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    if (obj == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    if (request.getMethod().equals("POST")) {

        obj.setNome(request.getParameter("nome"));
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
            Categoria
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Código</label>
                        <input class="form-control" type="text" readonly  value="<%=obj.getCodigo()%>"  />
                    </div>

                    <div class="form-group">
                        <label>Nome</label>
                        <input name="nome" class="form-control" type="text" required value="<%=obj.getNome()%>" />
                    </div>



                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>