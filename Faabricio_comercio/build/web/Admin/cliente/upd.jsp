
<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@include file="../cabecalho.jsp" %>
<%

    if (request.getParameter("codigo") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String msg = "teste";
    String classe = "alert-danger";

    ClienteDAO dao = new ClienteDAO();
    Cliente obj = new Cliente();

    obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    if (obj == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    if (request.getMethod().equals("POST")) {

        obj.setNome(request.getParameter("nome"));
        obj.setBairro(request.getParameter("bairro"));
        obj.setCep(request.getParameter("cep"));
        obj.setCidade(request.getParameter("cidade"));
        obj.setEmail(request.getParameter("email"));
        obj.setEndereco(request.getParameter("endereco"));
        obj.setEstado(request.getParameter("estado"));
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
            Cliente
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
                    <div class="form-group">
                        <label>Bairro</label>
                        <input name="bairro" class="form-control" type="text" required value="<%=obj.getBairro()%>" />
                    </div>
                    <div class="form-group">
                        <label>Cep</label>
                        <input name="cep" class="form-control" type="text" required value="<%=obj.getCep()%>" />
                    </div>
                    <div class="form-group">
                        <label>Cidade</label>
                        <input name="cidade" class="form-control" type="text" required value="<%=obj.getCidade()%>" />
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input name="email" class="form-control" type="text" required value="<%=obj.getEmail()%>" />
                    </div>
                    <div class="form-group">
                        <label>Endereço</label>
                        <input name="endereco" class="form-control" type="text" required value="<%=obj.getEndereco()%>" />
                    </div>  
                    <div class="form-group">
                        <label>Estado</label>
                        <input name="estado" class="form-control" type="text" required value="<%=obj.getEstado()%>" />
                    </div>
                    <div class="form-group">
                        <label>Senha</label>
                        <input name="senha" class="form-control" type="text" required value="<%=obj.getSenha()%>" />





                        <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

                        </form>

                    </div>


                </div>
        </div>
        <!-- /.row -->
        <%@include file="../rodape.jsp" %>