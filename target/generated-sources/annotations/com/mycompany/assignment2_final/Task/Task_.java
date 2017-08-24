package com.mycompany.assignment2_final.Task;

import com.mycompany.assignment2_final.Customer.Customer;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-20T19:53:14")
@StaticMetamodel(Task.class)
public class Task_ { 

    public static volatile SingularAttribute<Task, Long> id;
    public static volatile SingularAttribute<Task, String> Task_Name;
    public static volatile SingularAttribute<Task, Customer> customer;

}