<%@page import="modelo.Status"%>
<%@page import="dao.StatusDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "testando";
    String classe = "alert-danger";

    StatusDAO dao = new StatusDAO();
    Status obj = new Status();
    if(request.getParameter("nome") != null){
    
    obj.setDescricao(request.getParameter("nome"));
    Boolean resultado = dao.incluir(obj);
    if (resultado) {
        msg = "Registo criado com sucesso";
        classe = "alert-success";
    } else {
        msg = "Não foi possivel criado";
        classe = "alert-danger";
    }
    }

%>

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
            Status
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Descricao</label>
                        <input name="nome" class="form-control" type="text" required />
                    </div>



                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>