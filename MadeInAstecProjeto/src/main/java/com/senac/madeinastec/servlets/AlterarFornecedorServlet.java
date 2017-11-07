/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.dao.FornecedorDAO;
import com.senac.madeinastec.exceptions.FornecedorException;
import com.senac.madeinastec.exceptions.DataSourceException;
import com.senac.madeinastec.model.Fornecedor;
import com.senac.madeinastec.service.ServicoFornecedor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author magno
 */
@WebServlet(name = "AlterarFornecedorServlet", urlPatterns = {"/alterarfornecedor"})
public class AlterarFornecedorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          RequestDispatcher dispatcher
	    = request.getRequestDispatcher("/cadastroFornecedor.jsp");
    dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Instância Objeto Fornecedor
        Fornecedor fornecedor = new Fornecedor();
        
        //Instância serviço de servidor para efetuar consulta e ligação com FornecedorDAO
        ServicoFornecedor sf = new ServicoFornecedor();
        
        //Criação se sessão para retorno em tela
        HttpSession sessao = request.getSession();
        
        //Para verificação se é alteração
        String alteracao = "";
        try {
            alteracao = sessao.getAttribute("Altera").toString();
        } catch (Exception e) {
        }
        
        
        if ((alteracao == null)||(alteracao.length() == 0)){
              //Atribuição de valores digitados na tela de fornecedor e código da empresa
            String codigoFornecedor = request.getParameter("codigofornecedor");
            String codigoempresa = (String) sessao.getAttribute("Empresa");
            
            try {
            fornecedor = sf.retornaFornecedor(Integer.parseInt(codigoFornecedor), Integer.parseInt(codigoempresa));
            } catch (Exception e) {
            }
        
            sessao.setAttribute("for", fornecedor);
            sessao.setAttribute("Altera", "alteracao");
            response.sendRedirect(request.getContextPath() + "/cadastroFornecedor.jsp");
        }else{
            Fornecedor f = new Fornecedor();
            f = (Fornecedor) sessao.getAttribute("for");
            String nomeFornecedor = request.getParameter("fornecedor");
            int codigo = f.getCodigo();
            int codigoempresa = f.getCodigoempresa();
            
            //Verifica campos obrigatórios
            if((nomeFornecedor.length() == 0)||(String.valueOf(codigoempresa).length() == 0)){
                sessao.setAttribute("mensagemErroCampos", "Verifique campos obrigatórios!");
                RequestDispatcher dispatcher
                = request.getRequestDispatcher("/cadastroFornecedor.jsp");
                dispatcher.forward(request, response);
            }else{
                sessao.setAttribute("mensagemErroCampos", "");
                try {
                fornecedor.setCodigo(codigo);
                fornecedor.setCodigoempresa(codigoempresa);
                fornecedor.setNome(nomeFornecedor);
                sf.atualizarFornecedor(fornecedor.getNome(), fornecedor.getCodigo(), fornecedor.getCodigoempresa());
                } catch (Exception e) {
                }
                response.sendRedirect(request.getContextPath() + "/consultarFornecedor.jsp");
                sessao.setAttribute("Altera", "");  
            }
            
        }
           
        
    }

}
