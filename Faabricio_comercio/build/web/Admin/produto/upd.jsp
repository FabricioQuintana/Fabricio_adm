
<%@page import="java.util.List"%>
<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Marca"%>
<%@page import="dao.MarcaDAO"%>
<%@include file="../cabecalho.jsp" %>
<%

    if (request.getParameter("codigo") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String msg = "teste";
    String classe = "alert-danger";

    ProdutoDAO dao = new ProdutoDAO();
    Produto obj = new Produto();
   
    CategoriaDAO cDAO = new CategoriaDAO();
    MarcaDAO mDAO = new MarcaDAO();
    List<Categoria> cLista;
    cLista = cDAO.listar();
    List<Marca> mLista = mDAO.listar();


    obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    if (obj == null) {
        response.sendRedirect("index.jsp");
        return;
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
            Produto
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
                        <label>Descrição</label>
                        <input name="desc" class="form-control" type="text" required value="<%=obj.getDescricao()%>" />
                    </div>
                      <div class="form-group">
                        <label>Destaque</label>
                        <input name="dest" class="form-control" type="text" required value="<%=obj.getDestaque()%>" />
                    </div>
                      <div class="form-group">
                        <label>Preço</label>
                        <input name="preco" class="form-control" type="text" required value="<%=obj.getPreco() %>" />
                    </div>
                      <div class="form-group">
                        <label>Quantidade</label>
                        <input name="quant" class="form-control" type="text" required value="<%=obj.getQuant()%>" />
                    </div>
                      <div class="form-group">
                        <label>Título</label>
                        <input name="titu" class="form-control" type="text" required value="<%=obj.getTitulo()%>" />
                    </div>
                    
                      <label>Categoria</label>
                        <select class="form-control" name="codcat">
                            <option></option>
                            <%for (Categoria cat : cLista) {%>
                            <option value="<%=cat.getCodigo()%>"><%=cat.getNome()%></option>
                            <%}%>
                        </select>

                        <label>Marca</label>
                        <select  class="form-control" name="codmar">
                            <%for (Marca mar : mLista) {%>
                            <option value="<%=mar.getCodigo()%>"><%=mar.getNome()%></option>
                            <%}%>
                        </select>
                    
                       <label>Imagem 1</label>
                        <input name="imagem1" class="form-control" type="file" required />

                        <label>Imagem 2</label>
                        <input name="imagem2" class="form-control" type="file" required />

                        <label>Imagem 3</label>
                        <input name="imagem3" class="form-control" type="file" required />
                    </div>


                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>