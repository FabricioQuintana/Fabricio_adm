package dao;

import java.io.Serializable;

import modelo.Produto;

public class ProdutoDAO extends GenericDAO<Produto, Integer> {

    public ProdutoDAO() {
        
        super(Produto.class);
    }

}
