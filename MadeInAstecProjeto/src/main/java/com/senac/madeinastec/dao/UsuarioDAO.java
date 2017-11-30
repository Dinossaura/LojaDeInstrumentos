package com.senac.madeinastec.dao;

import com.senac.madeinastec.model.Usuario;
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

public class UsuarioDAO extends ConexaoBanco{
        ConexaoBanco conexaoBanco = new ConexaoBanco();    
        Connection conn = conexaoBanco.createConnection();
    //insere novo usuário
    public void inserirUsuario(Usuario usuario){
        System.out.println("Iniciando processo de inserção de Usuario...");
        String query = "insert into usuarios (nome, login, senha, codigoperfil, codigoempresa) values (?,?,?,?,?)";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setString(2, usuario.getLogin());
            preparedStatement.setString(3, usuario.getSenha());
            preparedStatement.setInt(4, usuario.getcodigoPerfil());
            preparedStatement.setInt(5, usuario.getCodigoEmpresa());
        
            preparedStatement.executeUpdate();
            preparedStatement.close();
            System.out.println("Usuario inserido com sucesso.");
            
        } catch (SQLException ex) {
            System.out.println(ex);
            System.out.println("Erro ao salvar Usuário");
        }
    }
    //altera usuário existente
    public void updateUsuario(int codigo, int codigoempresa, int codigoperfil, String nome, String login, String senha) throws Exception{
        System.out.println("Atualizando Usuário...");
         String query = "UPDATE usuarios SET nome=?, login=?, senha=?, codigoperfil=?, codigoempresa=? where codigo =?";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setString(1, nome);
            preparedStatement.setString(2, login);
            preparedStatement.setString(3, senha);
            preparedStatement.setInt(4, codigoperfil);
            preparedStatement.setInt(5, codigoempresa);
            preparedStatement.setInt(6, codigo);// estava 5 aqui
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar usuario");
            throw new Exception("Erro ao atualizar usuario", ex);
        }
    }  
    //lista usuários
    public List<Usuario> listarUsuario(String nome, int codigoempresa){ //retorna todos itens
        List<Usuario> lista = new ArrayList<>();
        System.out.println("Buscando produto na base de dados...");
        String query = "";
        boolean vazio = false;
        
        if("".equals(nome)){
            vazio = true;
            query = "SELECT * FROM usuarios WHERE codigoempresa=?";
        }else{
            vazio = false;
            query = "SELECT * FROM usuarios WHERE nome LIKE ? and codigoempresa=?";
        }
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            if(vazio == true){
                preparedStatement.setInt(1,codigoempresa);
            }else{
                preparedStatement.setString(1, nome+"%");
                preparedStatement.setInt(2,codigoempresa);
            }
            
            
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){
                Usuario usuario = new Usuario();
                usuario.setCodigo(rs.getInt(1));
                usuario.setNome(rs.getString(2));
                usuario.setLogin(rs.getString(3));
                usuario.setSenha(rs.getString(4));
                usuario.setcodigoPerfil(rs.getInt(5));
                usuario.setCodigoEmpresa(rs.getInt(6));
                lista.add(usuario);
            }

            System.out.println("Busca efetuada com sucesso");
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar usuário: "+ex);
        }        
        return lista;
    
    }
    //encontra usuário por código
    public Usuario encontrarUsuario(String login, String senha, int empresa){//retorna um item
        List<Usuario> lista = new ArrayList<>();
        Usuario usuario = new Usuario();
        System.out.println("Buscando Usuário na base de dados...");
        String query = "SELECT * FROM usuarios WHERE login=? and senha=? and codigoempresa=?";
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setString(1,login);
            preparedStatement.setString(2,senha);
            preparedStatement.setInt(3, empresa);
            
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()){
                usuario.setCodigo(rs.getInt(1));
                usuario.setNome(rs.getString(2));
                usuario.setLogin(rs.getString(3));
                usuario.setSenha(rs.getString(4));
                usuario.setcodigoPerfil(rs.getInt(5));
                usuario.setCodigoEmpresa(rs.getInt(6));
                lista.add(usuario);
            }else{
                return null;
            }
            
            System.out.println("Busca efetuada com sucesso");
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar usuario"+ex);
            
        }        
        return usuario;
    }
    
    //encontra usuário por nome
    public boolean encontrarUsuarioNome(String login, int empresa){//retorna um boolean
        Usuario usuario = new Usuario();
        boolean verifica = false;
        System.out.println("Buscando Usuário na base de dados...");
        String query = "SELECT * FROM usuarios WHERE login=? and codigoempresa=?";
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setString(1,login);
            preparedStatement.setInt(2, empresa);
            
            ResultSet rs = preparedStatement.executeQuery();
           
            while (rs.next()){
                usuario.setCodigo(rs.getInt(1));
                usuario.setNome(rs.getString(2));
                usuario.setLogin(rs.getString(3));
                usuario.setSenha(rs.getString(4));
                usuario.setcodigoPerfil(rs.getInt(5));
                usuario.setCodigoEmpresa(rs.getInt(6));
                verifica = true;
            } 
          
            System.out.println("Busca efetuada com sucesso");
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar usuario"+ex);
            
        }        
        return verifica;
    }
    
    //deletar usuário
    public void deletarUsuario(int codigo, int codigoempresa) throws Exception{
        System.out.println("Deletando de codigo: "+codigo);
        String query = "DELETE FROM USUARIOS WHERE codigo=? and codigoempresa=?";
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            
            preparedStatement.setInt(1, codigo);
            preparedStatement.setInt(2, codigoempresa);  
            preparedStatement.execute();
            
            System.out.println("Usuário deletado");
        } catch (SQLException ex) {
            throw new Exception("Erro ao deletar usuário", ex);
        }
    }
    
     public Usuario encontrarUmUsuario(int codigo, int codigoempresa){//retorna um item
        List<Usuario> lista = new ArrayList<>();
        Usuario usuario = new Usuario();
        System.out.println("Buscando produto na base de dados...");
        String query = "SELECT * FROM usuarios WHERE codigo=? and codigoempresa=?";//addicionar o % %
        boolean verifica = false;//Variável verifica a existência do usuário
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setInt(1,codigo);
            preparedStatement.setInt(2,codigoempresa);
            
                        
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                //usuario.setCodigo(rs.getInt(codigo));
                usuario.setCodigo(rs.getInt("codigo"));
                usuario.setLogin(rs.getString("login"));
                usuario.setNome(rs.getString("nome"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setCodigoEmpresa(rs.getInt("codigoempresa"));
                usuario.setcodigoPerfil(rs.getInt("codigoperfil"));                
                
                lista.add(usuario);
                verifica = true;
                System.out.println("Busca efetuada com sucesso");
            }
            
            
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar produto"+ex);
        }
        
        if(verifica == false){
            usuario = null;
        }
        
        return usuario;
    
    }
     
     
}
