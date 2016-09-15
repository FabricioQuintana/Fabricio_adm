package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Produto;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-08-18T09:05:20")
@StaticMetamodel(Marca.class)
public class Marca_ { 

    public static volatile SingularAttribute<Marca, Integer> codigo;
    public static volatile SingularAttribute<Marca, String> nome;
    public static volatile CollectionAttribute<Marca, Produto> produtoCollection;

}