<%@page import="util.Criptografia"%>
<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "testando";
    String classe = "alert-danger";

    ClienteDAO dao = new ClienteDAO();
    Cliente obj = new Cliente();
    if (request.getParameter("nome") != null) {

        obj.setNome(request.getParameter("nome"));
        obj.setBairro(request.getParameter("bairro"));
        obj.setCep(request.getParameter("cep"));
        obj.setCidade(request.getParameter("cidade"));
        obj.setEmail(request.getParameter("email"));
        obj.setEndereco(request.getParameter("endereco"));
        obj.setEstado(request.getParameter("estado"));
        obj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("senha")));
        
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
            Cliente
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Nome</label>
                        <input name="nome" class="form-control" type="text" required />
                    </div>
                    <div class="form-group">
                        <label>Bairro</label>
                        <input name="bairro" class="form-control" type="text" required  />
                    </div>
                    <div class="form-group">
                        <label>Cep</label>
                        <input name="cep" class="form-control" type="text" required minlength="8" maxlength="8" />
                    </div>
                    <div class="form-group">
                        <label>Cidade</label>
                        <input name="cidade" class="form-control" type="text" required  />
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input name="email" class="form-control" type="text" required  />
                    </div>
                    <div class="form-group">
                        <label>Endereço</label>
                        <input name="endereco" class="form-control" type="text" required  />
                    </div>  
                    <div class="form-group">
                        <label>Estado</label>
                        <input name="estado" class="form-control" type="text"  required  />
                    </div>
                    <div class="form-group">
                        <label>Senha</label>
                        <input name="senha" class="form-control" type="text" minlength="32" maxlength="32" required/>





                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>