package dao;

import java.io.Serializable;

import modelo.Usuario;

public class UsuarioDAO extends GenericDAO<Usuario, String> {

    public UsuarioDAO() {
        
        super(Usuario.class);
    }

}
