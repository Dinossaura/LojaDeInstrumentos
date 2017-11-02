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
    public Usuario updateUsuario(Usuario usuario) throws Exception{
        System.out.println("Atualizando Usuário...");
         String query = "UPDATE usuarios SET nome=?, login=?, senha=?, codigoperfil=?, codigoempresa=? where codigo =?";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setString(2, usuario.getLogin());
            preparedStatement.setString(3, usuario.getSenha());
            preparedStatement.setInt(4, usuario.getcodigoPerfil());
            preparedStatement.setInt(5, usuario.getCodigoEmpresa());
            preparedStatement.setInt(5, usuario.getCodigo());
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar produto");
            throw new Exception("Erro ao atualizar produto", ex);
        }

        return usuario;
    }  
    //lista usuários
    public List<Usuario> listarUsuario(String nome){ //retorna todos itens
        List<Usuario> lista = new ArrayList<>();
        System.out.println("Buscando produto na base de dados...");
        String query = "";
        
        if("".equals(nome)){
            query = "SELECT * FROM usuarios";
        }else{
            query = "SELECT * FROM usuarios WHERE nome LIKE ?";
        }
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            //preparedStatement.setString(1,"%"+nome+"%");
            
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){
                Usuario usuario = new Usuario();
                usuario.setCodigo(rs.getInt(1));
                usuario.setNome(rs.getString(2));
                usuario.setLogin(rs.getString(3));
                usuario.setSenha(rs.getString(4));
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
               while (rs.next()){
                usuario.setCodigo(rs.getInt(1));
                usuario.setNome(rs.getString(2));
                usuario.setLogin(rs.getString(3));
                usuario.setSenha(rs.getString(4));
                usuario.setcodigoPerfil(rs.getInt(5));
                usuario.setCodigoEmpresa(rs.getInt(6));
                lista.add(usuario);
                } 
            }else{
                return null;
            }
            
            System.out.println("Busca efetuada com sucesso");
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar usuario"+ex);
            
        }        
        return usuario;
    }
    //deletar usuário
    public void deletarUsuario(int codigo) throws Exception{
        System.out.println("Deletando de codigo: "+codigo);
        String query = "DELETE FROM usuario WHERE codigo=?";
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            
            preparedStatement.setInt(1, codigo);            
            preparedStatement.execute();
            
            System.out.println("Usuário deletado");
        } catch (SQLException ex) {
            throw new Exception("Erro ao deletar usuário", ex);
        }
    }
    
     public Usuario encontrarUmUsuario(int codigo){//retorna um item
        List<Usuario> lista = new ArrayList<>();
        Usuario usuario = new Usuario();
        System.out.println("Buscando produto na base de dados...");
        String query = "SELECT * FROM usuarios WHERE codigo=?";//addicionar o % %
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setInt(1,codigo);
            
            
                        
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){

                //usuario.setCodigo(rs.getInt(codigo));
                usuario.setLogin(rs.getString("login"));
                usuario.setNome(rs.getString("nome"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setCodigoEmpresa(rs.getInt("codigoempresa"));
                usuario.setcodigoPerfil(rs.getInt("codigoperfil"));                
                
                
                lista.add(usuario);
            }
            
            System.out.println("Busca efetuada com sucesso");
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar produto"+ex);
        }        
        return usuario;
    
    }
}
