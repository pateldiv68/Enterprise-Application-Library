package com.mycompany.assignment2_final.Project;

import com.mycompany.assignment2_final.Customer.Customer;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-20T19:53:14")
@StaticMetamodel(Project.class)
public class Project_ { 

    public static volatile SingularAttribute<Project, Long> id;
    public static volatile SingularAttribute<Project, String> Project_Name;
    public static volatile SingularAttribute<Project, Customer> customer;

}