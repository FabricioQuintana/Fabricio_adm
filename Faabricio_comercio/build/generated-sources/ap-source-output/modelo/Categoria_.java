package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Produto;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-08-18T09:05:20")
@StaticMetamodel(Categoria.class)
public class Categoria_ { 

    public static volatile SingularAttribute<Categoria, Integer> codigo;
    public static volatile SingularAttribute<Categoria, String> nome;
    public static volatile CollectionAttribute<Categoria, Produto> produtoCollection;

}