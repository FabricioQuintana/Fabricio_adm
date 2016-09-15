package dao;

import java.io.Serializable;

import modelo.Venda;

public class VendaDAO extends GenericDAO<Venda, Integer> {

    public VendaDAO() {
        
        super(Venda.class);
    }

}
