package com.db;


import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URISyntaxException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * JDBC工具类
 *@version 1.0
 **/

public class JDBCUtils {
    private static String url;

    private static String driverClassName;

    private static String userName;

    private static String password;

    /**
     * 本类不需要实例化，构造方法私有化
     */
    private JDBCUtils(){}

    static{
        //JDBCUtils.class.getResource("/") 取到的是根路径
        //toURI() 将空格转换下
        try {
            //获取文件
            File file = new File(JDBCUtils.class.getResource("/").toURI().getPath()+ DBConstant.FILE_NAME);

            Reader reader = new BufferedReader(new FileReader(file));

            //用来读取配置文件
            Properties properties = new Properties();

            properties.load(reader);

            url = String.valueOf(properties.get(DBConstant.JDBC_URL));

            driverClassName = String.valueOf(properties.get(DBConstant.JDBC_DRIVER));

            userName = String.valueOf(properties.get(DBConstant.JDBC_USERNAME));

            password = String.valueOf(properties.get(DBConstant.JDBC_PASSWORD));

//			System.out.println(driverClassName);
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    /**
     * 获取连接
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public static Connection getConnection () throws ClassNotFoundException, SQLException{
        //1.加载驱动
        Class.forName(driverClassName);
        //2.获取连接
//		String url = url;

        Connection con =  DriverManager.getConnection(url, userName, password);

        return con;
    }
    /**
     * 关闭资源
     * @param rs
     * @param st
     * @param con
     */
    public static void colse(ResultSet rs,Statement st , Connection con){
        try {
            try {
                if(rs != null){
                    rs.close();
                }
                rs = null;
            } finally{
                try{
                    if(st != null){
                        st.close();
                    }
                    st = null;
                }finally{
                    if (con != null) {
                        con.close();
                    }
                    con = null;
                }
            }
        } catch (SQLException e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }
    /**
     * 增删改
     * @param sql
     * @param param
     * @return
     */
    public static int execute(String sql,Object ... param){
        Connection con = null;

        PreparedStatement ps = null;

        int result = -1;

        try {
            con = getConnection();

            ps = con.prepareStatement(sql);

            if(param != null){
                for (int i = 0; i < param.length; i++) {
                    ps.setObject(i+1, param[i]);
                }
            }
            result = ps.executeUpdate();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            colse(null, ps, con);
        }
        return result;
    }
    public static long getCount(String sql)  {


            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                con = getConnection();
                ps =  con.prepareStatement(sql);
                //判断是否参数

                rs = ps.executeQuery();
                ResultSetMetaData meta = rs.getMetaData();

                while(rs.next()){
                     return (Long) rs.getObject(1);

                    }

            } catch (ClassNotFoundException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (SecurityException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IllegalArgumentException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } finally {
                colse(rs, ps, con);
            }
            return 0L;

    }
    /**
     * 查询，返回集合
     * @param sql
     * @param clazz
     * @param args
     * @return
     */
    public static <T> List<T> queryForList(String sql,Class<T> clazz ,Object ... args){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<T> list = new ArrayList<T>();
        try {
            con = getConnection();
            ps =  con.prepareStatement(sql);
            //判断是否参数
            if (args != null) {
                for (int i = 0; i < args.length; i++) {
                    ps.setObject(i+1, args[i]);
                }
            }
            rs = ps.executeQuery();
            //Student studentId useName ;t_student student_id user_name
            //获取数据库表结构  包含数据库字段
            list= toList(rs, clazz);

        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SecurityException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            colse(rs, ps, con);
        }
        return list;
    }
    /**
     * 将ResultSet 转化为List
     * @param rs
     * @param clazz
     * @return
     */
    public static <T> List<T> toList(ResultSet rs,Class<T> clazz) {
        List<T> list = new ArrayList<T>();

        try {
            ResultSetMetaData meta = rs.getMetaData();
            //根据类获取属性
            Field fields [] = clazz.getDeclaredFields();

            while(rs.next()){
                //实例化出对象
                T obj = clazz.newInstance();
                //遍历所有属性
                for (Field field : fields) {
                    //获取属性名
                    String fieldName = field.getName();
                    //获取属性类型
                    Class<?> fieldType = field.getType();
                    //计算表中的字段数量
                    int columnCount = meta.getColumnCount();
                    for (int i = 1; i <= columnCount; i++) {

                        String colunmName = meta.getColumnName(i);
//						colunmName = substring(colunmName);
                        //如果字段名和属性名一致
                        if(fieldName.equalsIgnoreCase(substring(colunmName))){

                            Object value = rs.getObject(colunmName);
                            if(value != null){
                                //获取set方法：set+属性首字母大写，其它不变
                                String methodName = "set"+String.valueOf(fieldName.charAt(0)).toUpperCase()+fieldName.substring(1);
                                Method method = clazz.getMethod(methodName, fieldType);
                                method.invoke(obj, value);
                            }
                        }
                    }
                }
                if(obj != null){
                    list.add(obj);
                }
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SecurityException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return list;
    }
    /**
     * 将字段中下划线去掉
     * @param columnName
     * @return
     */
    public static String substring(String columnName){
        String array [] = columnName.split("_");
        StringBuilder sb = new StringBuilder();
        for (String string : array) {
            sb.append(string);
        }
        return sb.toString();
    }
    /**
     * 查询单个对象
     * @param sql
     * @param clazz
     * @param args
     * @return
     */
    public static <T> T queryForObject(String sql,Class<T> clazz ,Object ... args){
        List<T> list = queryForList(sql, clazz, args);

        T obj = null;
        //如果集合大小大于0
        if(list != null && list.size() > 0){
            obj = list.get(0);
        }

        return obj;
    }

    public static void main(String[] args) {
        getCount("");
    }

}
