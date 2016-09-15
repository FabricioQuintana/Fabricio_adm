

<%@page import="modelo.Produto"%>
<%@page import="java.util.List"%>

<%@page import="dao.ProdutoDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    ProdutoDAO dao = new ProdutoDAO();
    List<Produto> lista;
    lista = dao.listar();

    lista = dao.listar();
    if (request.getParameter("filtro") != null) {

        lista = dao.filtro(request.getParameter("filtro"));
    } else {
        lista = dao.listar();
    }

    if (request.getParameter("codigo") != null) {
        Produto obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
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
            Gerenciamento de Produtos

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
                            <th>Código</th>
                            <th>Titulo</th>
                            <th>Descrição</th>
                            <th>Quantidade</th>
                            <th>Preço</th>
                            <th>Categoria</th>
                            <th>Marca</th>
                            <th>Destaque</th>
                            <th>Imagem 1</th>
                            <th>Imagem 2</th>
                            <th>Imagem 3</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Produto item : lista) {

                        %>
                        <tr>
                            <td><%=item.getCodigo()%></td>
                            <td><%=item.getTitulo()%></td>
                            <td><%=item.getDescricao()%></td>
                            <td><%=item.getQuant() %></td>
                            <td><%=item.getPreco()%></td>
                            <td><%=item.getCodcategoria()%></td>
                            <td><%=item.getCodmarca()%></td>
                            <td><%=item.getDestaque()%></td>
                             <td><%=item.getImagem1() %></td>
                            <td><%=item.getImagem2() %></td>
                            <td><%=item.getImagem3() %></td>
                            
                            <td><a href="upd.jsp?codigo=<%=item.getCodigo()%>" class="btn  btn-primary btn-sm">Alterar</a>
                                <a href="index.jsp?codigo=<%=item.getCodigo()%>" class="btn  btn-primary btn-sm">Excluir</a>  

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
