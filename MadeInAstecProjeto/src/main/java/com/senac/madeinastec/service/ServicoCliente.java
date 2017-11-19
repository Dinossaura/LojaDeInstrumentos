    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.service;
import com.senac.madeinastec.dao.ClienteDAO;
import com.senac.madeinastec.exceptions.ClienteException;
import com.senac.madeinastec.model.Cliente;
import com.senac.madeinastec.model.validador.ValidadorCliente;
import com.senac.madeinastec.exceptions.DataSourceException;
import java.util.List;
/**
 *
 * @author magno
 */

//Classe de servico do cliente
public class ServicoCliente {
     ClienteDAO clienteDAO = new ClienteDAO();
     

    public void cadastrarCliente(Cliente cliente) throws ClienteException, DataSourceException, Exception {

        ValidadorCliente.validar(cliente);

        try {
            clienteDAO.inserirCliente(cliente);
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }

    //Atualiza um cliente na fonte de dados
    public void atualizarCliente(Cliente cliente) throws ClienteException, DataSourceException, Exception {
        
        //ValidadorCliente.validar(cliente);

        try {
            clienteDAO.updateCliente(cliente);
        } catch (Exception e) {
            //Imprime qualquer erro técnico no console e devolve
            //uma exceção e uma mensagem amigável a camada de visão
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }

    //Realiza a pesquisa de um cliente por nome na fonte de dados
    public List<Cliente> procurarCliente(String nome, int codigoempresa) throws ClienteException, DataSourceException, Exception {
        try {
            return clienteDAO.listarCliente(nome, codigoempresa);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
            
        }
    }
    
    //Realiza a pesquisa de um cliente por nome na fonte de dados
    public Cliente obterClientePorCpf(String cpf, int codigoempresa) throws ClienteException, DataSourceException, Exception {
        try {
            if (cpf.length() == 0) {
                throw new Exception("Campo cpf vazio!");
            } else {
                return clienteDAO.encontrarClientePorCpf(cpf, codigoempresa);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }

    //Exclui o cliente com ID informado do mock
    public void excluirCliente(String cpf, int codigoempresa) throws ClienteException, DataSourceException, Exception {
        try {
            //Solicita ao DAO a exclusão do cliente informado
            clienteDAO.deletarCliente(cpf, codigoempresa);
        } catch (Exception e) {
            //Imprime qualquer erro técnico no console e devolve
            //uma exceção e uma mensagem amigável a camada de visão
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }
}
