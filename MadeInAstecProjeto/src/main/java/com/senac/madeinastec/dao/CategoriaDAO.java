package com.senac.madeinastec.dao;

import com.senac.madeinastec.model.Categoria;
import com.senac.madeinastec.utils.ConexaoBanco;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CategoriaDAO {
        ConexaoBanco conexaoBanco = new ConexaoBanco();    
        Connection conn = conexaoBanco.createConnection();
    
    //Insere nova categoria
    public void inserirCategoria(Categoria categoria){
        System.out.println("Iniciando processo de inserção de Categoria...");
        String query = "insert into categoria (nome) values (?);";
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, categoria.getNome());
            preparedStatement.executeUpdate();
            preparedStatement.close();
            System.out.println("Categoria inserida com sucesso.");
            
        } catch (SQLException ex) {
            System.out.println(ex);
            System.out.println("Erro ao salvar categoria");
        }
    }
    
    //Atualiza categoria
    public void atualizarCategoria(int codigo, String nome) throws Exception{
        System.out.println("Atualizando categoria...");
         String query = "UPDATE categoria SET nome=? WHERE codigo=?";
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
          
            preparedStatement.setString(1, nome);
            preparedStatement.setInt(2, codigo);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar categoria");
            throw new Exception("Erro ao atualizar categoria", ex);
        }
    }
    
    //Listar Categorias
    public List<Categoria> listarCategoria(String nome){ //retorna todos itens
        List<Categoria> lista = new ArrayList<>();
        System.out.println("Buscando categoria na base de dados...");
        String query = "";
        
        if(nome == ""){
            query = "SELECT * FROM categoria";
        }else{
            query = "SELECT * FROM categoria WHERE nome LIKE ?";
        }
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setString(1,"%"+nome+"%");
            
            ResultSet rs = preparedStatement.executeQuery();

            
                while (rs.next()){
                    Categoria categoria = new Categoria();
                    categoria.setCodigo(rs.getInt(1));
                    categoria.setNome(rs.getString(2));
                    lista.add(categoria);
                }

            System.out.println("Busca efetuada com sucesso");
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar categoria"+ex);
        }        
        return lista;
    }
    
    //Deletar categoria
    public void deletarProduto(int codigo) throws Exception{
            System.out.println("Deletando categoria de codigo: "+codigo);
            String query = "DELETE FROM categoria WHERE codigo=?";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            
            preparedStatement.setInt(1, codigo);            
            preparedStatement.execute();
            
            System.out.println("Categoria deletada");
        } catch (SQLException ex) {
            throw new Exception("Erro ao deletar categoria", ex);
        }
    }
}