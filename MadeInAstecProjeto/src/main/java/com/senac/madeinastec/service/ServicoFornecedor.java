    /*
    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.service;
import com.senac.madeinastec.dao.FornecedorDAO;
import com.senac.madeinastec.dao.UsuarioDAO;
import com.senac.madeinastec.exceptions.ClienteException;
import com.senac.madeinastec.model.Fornecedor;
import com.senac.madeinastec.model.validador.ValidadorFornecedor;
import com.senac.madeinastec.exceptions.DataSourceException;
import com.senac.madeinastec.exceptions.FornecedorException;
import java.util.List;
/**
 *
 * @author magno
 */

//Classe de servico do fornecedor
public class ServicoFornecedor {
     FornecedorDAO fornecedorDAO = new FornecedorDAO();
     

    public void cadastrarFornecedor(Fornecedor fornecedor) throws ClienteException, DataSourceException, Exception {

        ValidadorFornecedor.validar(fornecedor);

        try {
            fornecedorDAO.inserirFornecedor(fornecedor);
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }

    //Atualiza um cliente na fonte de dados
    public void atualizarFornecedor(String fornecedor, int codigofornecedor, int codigoempresa) throws ClienteException, DataSourceException, Exception {
        
        //ValidadorCliente.validar(cliente);

        try {
            fornecedorDAO.atualizarFornecedor(fornecedor, codigofornecedor, codigoempresa);
        } catch (Exception e) {
            //Imprime qualquer erro técnico no console e devolve
            //uma exceção e uma mensagem amigável a camada de visão
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }

    //Realiza a pesquisa de um cliente por nome na fonte de dados
    public List<Fornecedor> listarFornecedor(String nome, int codigoEmpresa) throws FornecedorException, DataSourceException, Exception {
        try {
            return fornecedorDAO.listarFornecedor(nome, codigoEmpresa);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
            
        }
    }
    
    //Pesquisa fornecedor especificado por codigo
    public Fornecedor retornaFornecedor(int codigofornecedor, int codigoempresa) throws ClienteException, DataSourceException{
        try {
            return fornecedorDAO.encontrarFornecedor(codigofornecedor, codigoempresa);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }
    
    //Pesquisa fornecedor especificado por nome
    public boolean retornafornecedorNome(String nome, int codigoempresa) throws ClienteException, DataSourceException{
        try {
            return fornecedorDAO.encontrarFornecedorNome(nome, codigoempresa);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }

    //Exclui o cliente com ID informado do mock
    public void excluiFornecedor(int codigo, int codigoempresa) throws ClienteException, DataSourceException, Exception {
        try {
            //Solicita ao DAO a exclusão do cliente informado
            fornecedorDAO.deletarfornecedor(codigo, codigoempresa);
        } catch (Exception e) {
            //Imprime qualquer erro técnico no console e devolve
            //uma exceção e uma mensagem amigável a camada de visão
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }
}
