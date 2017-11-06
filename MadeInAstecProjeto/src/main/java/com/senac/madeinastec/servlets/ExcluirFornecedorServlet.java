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
@WebServlet(name = "ExcluirFornecedorServlet", urlPatterns = {"/excluirfornecedor"})
public class ExcluirFornecedorServlet extends HttpServlet {

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
        
        //Instância serviço de servidor para efetuar consulta e ligação com FornecedorDAO
        ServicoFornecedor sf = new ServicoFornecedor();
        
        //Criação se sessão para retorno em tela
        HttpSession sessao = request.getSession();
        
        
        //Atribuição de valores digitados na tela de fornecedor e código da empresa
        String codigoFornecedor = request.getParameter("codigofornecedor");
        String codigoempresa = (String) sessao.getAttribute("Empresa");
            
        try {
            sf.excluiFornecedor(Integer.parseInt(codigoFornecedor), Integer.parseInt(codigoempresa));
        } catch (Exception e) {
        }
        
        sessao.setAttribute("fornecedorexcluido", codigoFornecedor);
        response.sendRedirect(request.getContextPath() + "/consultarFornecedor.jsp");

        }
           
        
}


