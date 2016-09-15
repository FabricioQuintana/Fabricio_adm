package dao;

import java.io.Serializable;

import modelo.Marca;

public class MarcaDAO extends GenericDAO<Marca, Integer> {

    public MarcaDAO() {
        
        super(Marca.class);
    }

}
