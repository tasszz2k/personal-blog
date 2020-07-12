/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.dao.impl;

import com.tasszz2k.dao.base.GenericDAO;
import com.tasszz2k.mapper.RowMapper;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TASS
 * @param <T>
 */
public class AbstractDAO<T> implements GenericDAO<T> {

    ResourceBundle resourceBundle = ResourceBundle.getBundle("db");
    
    public Connection getConnection() {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
            String url = resourceBundle.getString("url");
            String username = resourceBundle.getString("username");
            String password = resourceBundle.getString("password");
            Class.forName(resourceBundle.getString("driverName"));
            return DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    @Override
    public <T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters) {
        List<T> results = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            //set Parameter ()
            setParameter(statement, parameters);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                results.add(rowMapper.mapRow(resultSet));
            }
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(AbstractDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            try {
                //close all connection
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }
        }

    }

    private void setParameter(PreparedStatement statement, Object... parameters) {
        try {
            for (int i = 0; i < parameters.length; i++) {
                Object parameter = parameters[i];
                Integer index = i + 1;
                if (parameter instanceof Long) {
                    statement.setLong(index, (Long) parameter);
                } else if (parameter instanceof String) {
                    statement.setString(index, (String) parameter);
                } else if (parameter instanceof Integer) {
                    statement.setInt(index, (Integer) parameter);
                } else if (parameter instanceof Date) {
                    statement.setDate(index, (Date) parameter);
                } else if (parameter == null) {
                    statement.setNull(index, Types.NULL);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AbstractDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(String sql, Object... parameters) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql);
            setParameter(statement, parameters);
            statement.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            try {
                Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                //close all connection
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public Long insert(String sql, Object... parameters) {
        ResultSet resultSet = null;
        Connection connection = null;
        PreparedStatement statement = null;
        Long id = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            setParameter(statement, parameters);
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                id = resultSet.getLong(1);
            }
            connection.commit();
            return id;
        } catch (SQLException ex) {
            try {
                Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
                connection.rollback();
                return null;
            } catch (SQLException ex1) {
                Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                //close all connection
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }
        }
        return null;
    }

    @Override
    public Integer count(String sql, Object... parameters) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            Integer count = 0;
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            //set Parameter ()
            setParameter(statement, parameters);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                //(1): count(*)
                count = resultSet.getInt(1);
            }
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(AbstractDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        } finally {
            try {
                //close all connection
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
                return 0;
            }
        }
    }

}
