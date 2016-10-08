/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pacote;

import java.sql.ResultSet;

/**
 *
 * @author Marcos
 */
public class CCadastro {
    public String nome;
    //public String cpf;
    //public String rg;
    public int idade;
    //public double altura;
    public double peso;
    public int codigo;
       
    public void gravar() throws Exception{
        CBanco BB;
        try {
            BB = new CBanco();
            BB.preStmt = CBanco.con.prepareStatement("Insert into aluno(nome,idade,peso) values(?,?,?)");
            BB.preStmt.setString(1, this.nome);
            BB.preStmt.setInt(2, this.idade);
            BB.preStmt.setDouble(3, this.peso);
            BB.preStmt.executeUpdate();
        } catch (Exception ex) {
            throw new Exception("Erro ao gravar:"+ex.getMessage());
        }
    }    
    public void alterar() throws Exception
    {
        CBanco BB;
        try
        {
            BB = new CBanco();
            BB.preStmt = CBanco.con.prepareStatement("Update aluno set nome=?, idade=?, peso=?" +
                    "where codigo = ?");
            BB.preStmt.setString(1, this.nome);
            BB.preStmt.setInt(2, this.idade);
            BB.preStmt.setDouble(3, this.peso);
            BB.preStmt.setInt(4, this.codigo);
            BB.preStmt.executeUpdate();
        }
        catch (Exception ex)
        {
            throw new Exception("Erro ao alterar:"+ex.getMessage());
        }     
    }
    
    public void remover() throws Exception
    {
        CBanco BB;
        try
        {
            BB = new CBanco();
            BB.preStmt=CBanco.con.prepareStatement("Delete from aluno where codigo=?");
            BB.preStmt.setInt(1, this.codigo);
            BB.preStmt.executeUpdate();
        }
        catch(Exception ex)
        {
            throw new Exception("Erro ao remover:" + ex.getMessage());
        }
    }
    
    
    public ResultSet consulta() throws Exception {

        CBanco BB; 
        try {
            BB = new CBanco(); 
            BB.preStmt = CBanco.con.prepareStatement("Select codigo,nome,idade,peso from aluno");
            BB.tabela = BB.preStmt.executeQuery();
            return (BB.tabela);
            
        } catch (Exception ex) {
            throw new Exception("Erro ao consultar:"+ex.getMessage());
        }

    }

    public void setNome(String nome)
    {
        this.nome=nome;
    }
    public String getNome()
    {
        return nome;
    }
     public void setIdade(int idade)
    {
        this.idade=idade;
    }
    public int getIdade()
    {
        return idade;
    }
     public void setPeso(double peso)
    {
        this.peso=peso;
    }
    public double getPeso()
    {
        return peso;
    }
    public int getCodigo()
    {
        return codigo;
    }
}
