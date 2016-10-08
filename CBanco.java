/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pacote;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author aluno
 */
public class CBanco {
    public static Connection con = null;
    public PreparedStatement preStmt = null;
    public ResultSet tabela;

    public CBanco() throws Exception{
        try {
            Class.forName("org.postgresql.Driver");// registra o Driver
            if ((con == null) || (con.isClosed())) {
                con = DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5434/LP2", "postgres", "ifsp");
            }
        } 
        catch (Exception ex) {
            throw new Exception("Erro conexao Banco:"+ex.getMessage());
        }
    }
}
