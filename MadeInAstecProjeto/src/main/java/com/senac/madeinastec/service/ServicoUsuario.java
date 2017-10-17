    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.service;
import com.senac.madeinastec.dao.UsuarioDAO;
import com.senac.madeinastec.exceptions.ClienteException;
import com.senac.madeinastec.model.Cliente;
import com.senac.madeinastec.model.validador.ValidadorCliente;
import com.senac.madeinastec.exceptions.DataSourceException;
import com.senac.madeinastec.model.Usuario;
import com.senac.madeinastec.model.validador.ValidadorUsuario;
import java.util.List;
/**
 *
 * @author magno
 */

//Classe de servico do cliente
public class ServicoUsuario {
     UsuarioDAO usuarioDAO = new UsuarioDAO();
     

    public void cadastrarUsuario(Usuario usuario) throws ClienteException, DataSourceException, Exception {

        ValidadorUsuario.validar(usuario);

        try {
            usuarioDAO.inserirUsuario(usuario);
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }

    //Atualiza um cliente na fonte de dados
    public void atualizarUsuario(Usuario usuario) throws ClienteException, DataSourceException, Exception {
        
        //ValidadorCliente.validar(cliente);

        try {
            usuarioDAO.updateUsuario(usuario);
        } catch (Exception e) {
            //Imprime qualquer erro técnico no console e devolve
            //uma exceção e uma mensagem amigável a camada de visão
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }

    //Realiza a pesquisa de um cliente por nome na fonte de dados
    public List<Usuario> listarUsuarios(String nome) throws ClienteException, DataSourceException, Exception {
        try {
            return usuarioDAO.listarUsuario(nome);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
            
        }
    }
    
    //Pesquisa usuario especificado 
    public Usuario retornaUsuario(Usuario usuario) throws ClienteException, DataSourceException{
        try {
            return usuarioDAO.encontrarUsuario(usuario.getLogin(), usuario.getSenha(), usuario.getCodigoEmpresa());
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }

    //Exclui o cliente com ID informado do mock
    public void excluirUsuario(int codigo) throws ClienteException, DataSourceException, Exception {
        try {
            //Solicita ao DAO a exclusão do cliente informado
            usuarioDAO.deletarUsuario(codigo);
        } catch (Exception e) {
            //Imprime qualquer erro técnico no console e devolve
            //uma exceção e uma mensagem amigável a camada de visão
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }
}
