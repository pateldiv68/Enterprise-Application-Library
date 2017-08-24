package com.mycompany.assignment2_final.Log;

import com.mycompany.assignment2_final.TimeTracker.TimeTracker;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-20T19:53:14")
@StaticMetamodel(Log.class)
public class Log_ { 

    public static volatile SingularAttribute<Log, String> Log_Project;
    public static volatile SingularAttribute<Log, String> Log_Task;
    public static volatile SingularAttribute<Log, Date> Log_Sdate;
    public static volatile SingularAttribute<Log, Date> Log_Edate;
    public static volatile SingularAttribute<Log, TimeTracker> timeTracker;
    public static volatile SingularAttribute<Log, Date> Log_Time;
    public static volatile SingularAttribute<Log, Long> id;

}