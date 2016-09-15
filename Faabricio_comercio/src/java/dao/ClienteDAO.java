package dao;

import java.io.Serializable;

import modelo.Cliente;

public class ClienteDAO extends GenericDAO<Cliente, Integer> {

    public ClienteDAO() {
        
        super(Cliente.class);
    }

}
